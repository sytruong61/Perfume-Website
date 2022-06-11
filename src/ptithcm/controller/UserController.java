package ptithcm.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.TruyVan;
import ptithcm.bean.UserNow;
import ptithcm.entity.Admin;
import ptithcm.entity.CTDH;
import ptithcm.entity.DonHang;
import ptithcm.entity.LoaiSanPham;
import ptithcm.entity.User;

@Transactional
@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	SessionFactory factory;

	
	// hiển thị kiểm chứng
	@RequestMapping("show")
	public String show(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "FROM User";
		String hql1 = "FROM CTDH";
		String hql2="FROM DonHang";
		String hql3="FROM LoaiSanPham";
		//bang User		
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		model.addAttribute("user", list);
		// bảng CTDH
		query = session.createQuery(hql1);
		List<CTDH> list1 = query.list();
		model.addAttribute("CTDH", list1);
		
		query = session.createQuery(hql2);
		List<DonHang> list2 = query.list();
		model.addAttribute("DonHang", list2);
		
		query = session.createQuery(hql3);
		List<LoaiSanPham> list3 = query.list();
		model.addAttribute("LoaiSanPham", list3);
		
		return "HienThiCSDL";
	}
	
	@RequestMapping("show/delete/{id}/{ten}")
	public String show(@PathVariable("id")int id,@PathVariable("ten")String ten) {
		Session s = factory.getCurrentSession();
		String hql = "DELETE FROM User WHERE id =:id AND soDienThoai =:ten";
		Query q = s.createQuery(hql);		
		q.setParameter("id",id);
		q.setParameter("ten",ten);
		q.executeUpdate();
		
		hql = "DELETE FROM SanPham WHERE id =:id AND tenSP =:ten";
		q = s.createQuery(hql);
		q.setParameter("id",id);
		q.setParameter("ten",ten);
		q.executeUpdate();
		
		hql = "DELETE FROM DonHang WHERE id =:id  AND user.id =:ten";
		q = s.createQuery(hql);
		q.setParameter("id",id);
		q.setParameter("ten",Integer.parseInt(ten));
		q.executeUpdate();
		
		hql = "DELETE FROM CTDH WHERE id =:id AND sp_ID = :ten";
		
		q = s.createQuery(hql);
		q.setParameter("id",id);
		q.setParameter("ten",Integer.parseInt(ten));
		q.executeUpdate();
		return "redirect:/user/show.htm";
	}
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("user", new User());
		return "index";
	}

	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signUp(ModelMap model) {
		
		model.addAttribute("user", new User());
		return "formdangki";
	}

	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signUp(ModelMap model, @ModelAttribute("user") User user) {	
		Session session = factory.openSession(); 
		Transaction t= session.beginTransaction(); 
		try {			
			//biến kiểm tra validate 
			boolean check = true;
			
			// kiểm tra định dạng email : thuan@gmail.com.vn 
			if(user.getEmail().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangEmail","Email không được để trống"); 
			}
			else if(!user.getEmail().trim().matches("\\w+@\\w+(\\.\\w+)+")) {
				check = false;
				model.addAttribute("LoiDinhDangEmail","Email không hợp lệ"); 
			}
			else{				
				//kiểm tra sự tồn tại của email trong cơ sở dữ liêu 
				String hql = "FROM User WHERE email =:email"; 
				String hql1 = "FROM Admin WHERE email =:email";
				Query query = session.createQuery(hql);
				Query query1 = session.createQuery(hql1);
				query.setParameter("email", user.getEmail());
				query1.setParameter("email", user.getEmail());
				if((User)query.uniqueResult()!=null) {
					check = false;
					model.addAttribute("LoiDinhDangEmail","Địa chỉ email đã được sử dụng !"); 
				}
				else if((Admin)query1.uniqueResult()!=null) {
					model.addAttribute("LoiDinhDangEmail","Địa chỉ email đã được sử dụng !"); 
					check =false;
				}
				
			}
				
			// kiểm tra định dạng mật khẩu không ít hơn 8 kí tư và mật khẩu không chứ khoảng trắng
			if(user.getMatKhau().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không được để trống"); 
			}
			else if(user.getMatKhau().trim().contains(" "))
			{
				check = false;
				model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không có khoảng trắng"); 
			}
			else if(!user.getMatKhau().trim().matches(".{8,}")) {	
				check = false;
				model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không dưới 8 kí tự"); 
			}
			// kiểm tra định dạng của tên không được có số
			if(user.getTen().trim().equals("")) {
				check = false;
				model.addAttribute("LoiDinhDangTen","Tên không được để trống"); 
			}
			else if (!user.getTen().trim().matches("\\D+")) 
			{ 	
				check = false;
			 	model.addAttribute("LoiDinhDangTen","Tên không hợp lệ"); 
			}
						 		 
			
			
			// kiểm tra số điện thoại không có kí tự chữ và độ dài là 10 số
			if(user.getSoDienThoai().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangSDT","Số điện thoại không được để trống"); 
			}
			else if(!user.getSoDienThoai().trim().matches("\\d{10}")) {
				check = false;
				model.addAttribute("LoiDinhDangSDT","Số điện thoại không đúng"); 
			}
			
			// kiểm tra địa chỉ không được bỏ trống
			if(user.getDiaChi().trim().isEmpty()) {
				check = false;
				model.addAttribute("LoiDinhDangDiaChi","Địa chỉ không được để trống"); 
			}
			
			if(check){ 			
				user.setMatKhau(user.getMatKhau().toLowerCase()); // chuyển mật khẩu thành chữ thường
				user.setNgayTao(new Date()); 	// chọn ngày hôm này làm ngày tạo tài khoản
				
				session.save(user); 
				t.commit();
				UserNow.userName=user.getId()+"";
				UserNow.passWord=user.getMatKhau();
				//String ten[]=user.getTen().split(" ");
				//UserNow.ten=ten[user.getTen().length()-1];
				model.addAttribute("message","Thêm mới thành công !"); 
				UserNow.ten=user.getTen();
				return "redirect:/user/index.htm";
			}		  	  
		} 
		catch (Exception e) { 
			 t.rollback();
			 model.addAttribute("message","Thêm mới thất bại !"); 
		} 
		finally
		{
			session.close(); 
		}
		return "formdangki";

	}

	@RequestMapping(value="signin",method = RequestMethod.GET)
	public String signIn(ModelMap model) {
		UserNow.userName="none";
		UserNow.passWord="";
		UserNow.ten="";
		model.addAttribute("user",new User());
		return "formdangnhap";
	}
	
	@RequestMapping(value="signin",method = RequestMethod.POST)
	public String signIn(ModelMap model, @ModelAttribute("user")User user) {
			
		//biến kiểm tra validate 
		boolean check = true;
		
		// kiểm tra định dạng email : thuan@gmail.com.vn 
		if(user.getEmail().trim().isEmpty()) {
			check = false;
			model.addAttribute("LoiDinhDangEmail","Email không được để trống"); 
		}
		else if(!user.getEmail().trim().matches("\\w+@\\w+(\\.\\w+)+")) {
			check = false;
			model.addAttribute("LoiDinhDangEmail","Email không hợp lệ"); 
		}
		
			
		// kiểm tra định dạng mật khẩu không ít hơn 8 kí tư và mật khẩu không chứ khoảng trắng
		if(user.getMatKhau().trim().isEmpty()) {
			check = false;
			model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không được để trống"); 
		}
		else if(user.getMatKhau().trim().contains(" "))
		{
			check = false;
			model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không có khoảng trắng"); 
		}
		else if(!user.getMatKhau().trim().matches(".{8,}")) {	
			check = false;
			model.addAttribute("LoiDinhDangMatKhau","Mật khẩu không dưới 8 kí tự"); 
		}
		
		if(check){ 							
			//kiểm tra sự tồn tại của email trong cơ sở dữ liêu 
			Session session = factory.getCurrentSession();
			String hql = "FROM User u where u.email = :e and u.matKhau = :m";
			String hql1 = "FROM Admin WHERE email =:email";
			Query query = session.createQuery(hql);
			Query query1 = session.createQuery(hql1);
			query.setParameter("e", user.getEmail());
			query.setParameter("m", user.getMatKhau());
			query1.setParameter("email",user.getEmail() );
			User user1 = (User)query.uniqueResult(); 
			Admin ad =(Admin)query1.uniqueResult();
			if(!(user1==null)) {
			
				String mangTen[] = user1.getTen().split(" ");
				
				//model.addAttribute("nguoidung","block");
				//model.addAttribute("chedo","none");
				//model.addAttribute("user","Đơn hàng của "+mangTen[mangTen.length-1]);
				//model.addAttribute("userId", user1.getId());
				
				UserNow.userName=user1.getId()+"";
				UserNow.passWord = user1.getMatKhau();
				UserNow.ten = mangTen[mangTen.length-1];
				
				return "redirect:/user/index.htm";
			}
			else if(!(ad==null)){
				String mangTen[] = ad.getTen().split(" ");
				UserNow.userName=ad.getId()+"";
				UserNow.passWord = ad.getMatKhau();
				UserNow.ten = mangTen[mangTen.length-1];
				return "redirect:/user/index.htm";
			}
			model.addAttribute("message","Tài khoản và mật khẩu không chính xác"); 
		}
		
		return "formdangnhap";
	}
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("user") User user) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {

			// biến kiểm tra validate
			boolean check = true;
//		   kiểm tra sự tồn tại của email trong cơ sở dữ liêu
			String hql = "FROM User";
			Query query = session.createQuery(hql);
			List<User> list = query.list();
			for (User user2 : list) {
				if (user2.getEmail().equalsIgnoreCase(user.getEmail())) {
					model.addAttribute("message", "Trùng email !");
					return "index";
				}
			}
			if (!user.getTen().matches("\\D+")) {
				check = false;
				model.addAttribute("LoiTen", "Tên không hợp lệ");
				return "#";
			}

			if (check) {
				// chọn ngày hôm này làm ngày tạo tài khoản
				user.setNgayTao(new Date());
				session.save(user);
				t.commit();
				model.addAttribute("message", "Thêm mới thành công !");
			}

		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Thêm mới thất bại !");
		} finally {
			session.close();
		}
		return "index";
	}

	@RequestMapping("index")
	public String index(ModelMap model, HttpServletRequest request) {
		if(UserNow.userName.equals("none")) {
			//model.addAttribute("user", new User());
			model.addAttribute("chedo","block");
			model.addAttribute("nguoidung","block");
			model.addAttribute("admin","none");
			HttpSession session = request.getSession();
			session.setAttribute("admin", "none");
			model.addAttribute("userId","none");	
		}
		else {
			Session s= factory.getCurrentSession();
			String hql = "FROM Admin WHERE id= :idAD";
			Query q = s.createQuery(hql);
			q.setParameter("idAD",Integer.parseInt(UserNow.userName));
			
			if(q.list().isEmpty()) {
				model.addAttribute("chedo","none");
				model.addAttribute("nguoidung","block");
				model.addAttribute("user","Đơn hàng của "+UserNow.ten);	
				model.addAttribute("userId",UserNow.userName);
				model.addAttribute("admin","none");
				HttpSession session = request.getSession();
				session.setAttribute("admin", "none");
			}
			//nếu là admin
			else {
				model.addAttribute("chedo","none");
				model.addAttribute("nguoidung","none");
				model.addAttribute("user","Admin "+UserNow.ten);	
				model.addAttribute("userId",UserNow.userName);
				HttpSession session = request.getSession();
				session.setAttribute("admin", "block");
				model.addAttribute("admin","block");
			}
		}
		return "index";
	}
	
	@RequestMapping("dangxuat")
	public String dangXuat() {
		TruyVan.dsMaSanPham=new HashMap<Integer, Integer>();
		UserNow.clear();
		return"redirect:/user/index.htm";
	}
	// quên mật khẩu
	@Autowired
	JavaMailSender mailer;
	@RequestMapping(value = "quenmatkhau",method = RequestMethod.GET)
	public String send() {
		return "formquenmatkhau";
	}
	@RequestMapping(value="quenmatkhau",method = RequestMethod.POST)
	public String send(ModelMap model,@RequestParam("email")String to)

	{

		boolean check = true;
		// kiểm tra định dạng email : thuan@gmail.com.vn 
		if(to.trim().isEmpty()) {
			check = false;
			model.addAttribute("LoiDinhDangEmail","Email không được để trống"); 
		}
		else if(!to.trim().matches("\\w+@\\w+(\\.\\w+)+")) {
			check = false;
			model.addAttribute("LoiDinhDangEmail","Email không hợp lệ"); 
		}
		if(check) {
			try {
				Session s = factory.getCurrentSession();
				String hql = "SELECT matKhau FROM User WHERE email =:email";
				Query q = s.createQuery(hql);
				q.setParameter("email",to);			
				String matKhau = (String)q.uniqueResult();
				if(matKhau==null) {
					model.addAttribute("message","Tài khoản không tồn tại");
					//return "redirect:/user/signin.htm";
				}
				else {
					String from = "mailtext181100@gmail.com";			
					String subject="Cửa hàng nước hoa - Quên mật khẩu";
					String body="Mật khẩu của bạn là "+matKhau;
					MimeMessage mail = mailer.createMimeMessage();
					// su dung lop tro giup
					MimeMessageHelper helper = new MimeMessageHelper(mail);
					helper.setFrom(from,from);
					helper.setTo(to);
					helper.setReplyTo(from, from);
					helper.setSubject(subject);
					helper.setText(body,true);
					
					//gui mai
					mailer.send(mail);
					model.addAttribute("message","Gửi email thành công !, Vui lòng kiểm tra hộp thư");
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
				model.addAttribute("message", e.getMessage());
			}			
		}
		return "formquenmatkhau";
	}
	@ModelAttribute("soSanPham")
	public int laySoLuongSanPham() {
		int tong = 0;
		for (Integer ii : TruyVan.dsMaSanPham.values()) {
			tong+=ii;
		}
		return tong;
	}

  @ModelAttribute("dssanpham") 
  public List<LoaiSanPham> sanPham()
  { 
	  Session s = factory.getCurrentSession();
	  String hql = "FROM SanPham";
	  Query q= s.createQuery(hql);		  
	  List<LoaiSanPham> sanPham = q.list();
	return sanPham; 
  } 
	
}
