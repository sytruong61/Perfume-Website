USE [master]
GO
/****** Object:  Database [WEBBANHANG]    Script Date: 01/06/2021 19:30:29 ******/
CREATE DATABASE [WEBBANHANG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEBBANHANG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WEBBANHANG.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WEBBANHANG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\WEBBANHANG_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WEBBANHANG] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEBBANHANG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEBBANHANG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEBBANHANG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEBBANHANG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEBBANHANG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEBBANHANG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEBBANHANG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEBBANHANG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEBBANHANG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WEBBANHANG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEBBANHANG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEBBANHANG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEBBANHANG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEBBANHANG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEBBANHANG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEBBANHANG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEBBANHANG] SET RECOVERY FULL 
GO
ALTER DATABASE [WEBBANHANG] SET  MULTI_USER 
GO
ALTER DATABASE [WEBBANHANG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEBBANHANG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEBBANHANG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEBBANHANG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WEBBANHANG] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WEBBANHANG]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 01/06/2021 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](25) NULL,
	[created] [smalldatetime] NULL CONSTRAINT [DF_ADMIN_created]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTDH]    Script Date: 01/06/2021 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DH_ID] [int] NOT NULL,
	[SP_ID] [int] NOT NULL,
	[SOLUONG] [int] NOT NULL,
 CONSTRAINT [PK_CTDH] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 01/06/2021 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DONHANG](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[TENKH] [nvarchar](50) NOT NULL,
	[SDTKH] [varchar](12) NOT NULL,
	[DIACHIKH] [nvarchar](100) NOT NULL,
	[TONGTIEN] [money] NOT NULL,
	[EMAILKH] [varchar](max) NULL,
	[TRANGTHAI] [bit] NULL CONSTRAINT [DF_DONHANG_TRANGTHAI]  DEFAULT ((0)),
	[NGAYLAP] [smalldatetime] NULL CONSTRAINT [DF_DONHANG_NGAYLAP]  DEFAULT (getdate()),
 CONSTRAINT [PK_DONHANG] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAI]    Script Date: 01/06/2021 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAI](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TENLOAI] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LOAI] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 01/06/2021 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TENSP] [nvarchar](100) NOT NULL,
	[DONGIA] [money] NOT NULL,
	[HINHANH] [varchar](max) NOT NULL,
	[NGAYDANG] [smalldatetime] NULL,
	[MOTA] [nvarchar](max) NULL,
	[IDLOAI] [int] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 01/06/2021 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL CONSTRAINT [DF_users_name]  DEFAULT (N'unique'),
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[address] [nvarchar](125) NOT NULL,
	[password] [varchar](25) NOT NULL,
	[created] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ADMIN] ON 

INSERT [dbo].[ADMIN] ([id], [name], [email], [password], [created]) VALUES (1, N'Nguyễn Sỹ Trường', N'admin@gmail.com', N'123456789', CAST(N'2021-06-02 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[ADMIN] OFF
SET IDENTITY_INSERT [dbo].[CTDH] ON 

INSERT [dbo].[CTDH] ([ID], [DH_ID], [SP_ID], [SOLUONG]) VALUES (1, 1, 10, 1)
INSERT [dbo].[CTDH] ([ID], [DH_ID], [SP_ID], [SOLUONG]) VALUES (2, 1, 2, 2)
SET IDENTITY_INSERT [dbo].[CTDH] OFF
SET IDENTITY_INSERT [dbo].[DONHANG] ON 

INSERT [dbo].[DONHANG] ([id], [user_id], [TENKH], [SDTKH], [DIACHIKH], [TONGTIEN], [EMAILKH], [TRANGTHAI], [NGAYLAP]) VALUES (1, 27, N'Nguyễn Sỹ Trường', N'0343219012', N'Quận 9, Thành Phố Hồ Chí Minh', 12650000.0000, N'sytruong61@gmail.com', 0, CAST(N'2021-06-01 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[DONHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAI] ON 

INSERT [dbo].[LOAI] ([id], [TENLOAI]) VALUES (1, N'Nước hoa nam')
INSERT [dbo].[LOAI] ([id], [TENLOAI]) VALUES (3, N'Nước hoa nữ')
INSERT [dbo].[LOAI] ([id], [TENLOAI]) VALUES (2, N'Nước hoa Unisex')
SET IDENTITY_INSERT [dbo].[LOAI] OFF
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (1, N'Nautica Voyage', 1200000.0000, N'nau-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Nautica Voyage là một làn gió biển trong lành và mặn, mang theo mùi hương lãng mạn của các loại thảo mộc và rừng ven biển, và đánh thức bản năng của người đàn ông để đo sức mạnh của mình với thiên nhiên hoang dã. Đây là một mùi hương cho một người đàn ông năng động và lãng mạn sống theo quy tắc của riêng mình. Gương mặt của mùi hương là người dẫn chương trình truyền hình Caster Oosterhouse, một người thực sự lãng mạn và là một người giỏi giang. ', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (2, N'Dior Sauvage EDT', 3150000.0000, N'9fe851cd-23f4-475f-9966-c931cb11e899-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Mọi người hay hỏi sauvage có 3 loại biết chọn thế nào? Loại nào dễ dùng nhất? Vậy mình xin trả lời là Sauvage edt là dòng phổ biến và dễ dùng nhất đó ạ. Vừa đủ mát để dùng hè mà lại đủ cay nồng cho các thời tiết còn lại trong năm. Cam bergamot tươi mát, sảng khoái là nốt hương đầu tiên bạn có thể cảm nhận được. Tiếp đó là tiêu đen cay nồng cá tính. Cuối cùng, một chút hương Ambroxan nhẹ nhàng, làm dịu bớt sự hoang dã, phong trần của người đàn ông tự do, để tạo nên mùi hương cuốn hút. Francois Demachy, là nhà sáng chế nước hoa tài ba, đã lấy cảm hứng từ sa mạc nóng bỏng. Ông đã pha trộn sự mát mẻ của sa mạc ban đêm, không khí nóng bỏng ban ngày để hòa quyện và đốt cháy toát lên mùi hương sâu sắc. Trong thời gian khi thiên nhiên thức dậy và bầu trời đang lên, một ma thuật mới lại mở ra.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (3, N'Acqua Di Gio Pour Homme', 2500000.0000, N'Gio-trang-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Lấy cảm hứng từ vẻ đẹp của Pantellerie, nơi anh đã trải qua kỳ nghỉ của mình, Armani đã tạo ra mùi hương của Aqua di Gio cho nam và nữ. Hương thơm cho đàn ông là một mùi hương tự do, đầy gió và nước. Các thành phần được xây dựng của một sự hài hòa hoàn hảo của các ghi chú ngọt và mặn của nước biển và sắc thái của hơi ấm nắng trên da của bạn. Aqua di Gio tràn ngập ánh mặt trời Địa Trung Hải. Mướp đắng với sắc thái thơm của hương thảo đan xen với vị mặn, sắc thái biển và hedione dạng viên. Ghi chú sắc nét của gia vị được làm mềm bởi cơ sở gỗ với đường mòn ấm áp, xạ hương. Nó được tạo ra vào năm 1996 bởi Alberto Morillas . Acqua di Gio được tạo ra bởi Alberto Morillas và Annick Menardo .', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (4, N'Y EDP', 3350000.0000, N'ysl-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Không quá nổi bật và gây chú ý nhưng YSL Y EDP đủ tinh tế để khiến những người xung quanh bạn dễ chịu và muốn lại gần. YSL Y EDP là hương thơm khá thành công trong dòng nước hoa nam từ nhà Yves Saint Laurent. Lấy cảm hứng từ áo phông trắng và áo khoác đen mang tính biểu tượng, sự cân bằng của sự tươi mới và mạnh mẽ. Mùi vị táo xanh, cam bergamot và xô thơm mang đến một sự tươi mát lại có 1 chút ngọt vượt quá mọi mong đợi. YSL Y EDP thể hiện sức mạnh tinh tế của một chiếc áo khoác đen được thiết kế cầu kì và sang trọng mà với cả những người mới sử dụng thì khi khoác lên mùi hương của nó bạn sẽ ưng ngay lập tức.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (5, N'Aventus', 7500000.0000, N'aventus-eau-de-parfum-50ml-b5c-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Creed Aventus tôn vinh sức mạnh, tầm nhìn và sự thành công, lấy cảm hứng từ cuộc sống đầy giai thoại giữa chiến tranh, hòa bình và sự lãng mạn của hoàng đế Napoleon. Nhắc đến Aventus hẳn những ai yêu thích nước hoa đều phải dành cho nó nhiều mỹ từ, và từ ngữ miêu tả về nó một cách chân thật nhất đó là “vua” của nước hoa. Aventus có hương mở đầu với trái cây tươi mát đầy ngọt ngào của cam bergamot, táo và dứa, và đặc biệt là quả lý chua đen. Lớp hương giữa có pha trộn gia vị cay nồng và hương gỗ để làm dịu bớt vị ngọt của lớp hương đầu, mùi hương chuyển dần sang một hương thơm nam tính hơn. Lớp hương cuối cùng ấm áp và dịu nhẹ với hương vani, hổ phách và rêu sồi khô.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (6, N'Bleu De Chanel EDP', 3800000.0000, N'bleu-edp-1-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Bleu de Chanel là một loại nước hoa tinh tế và hiện đại của Chanel được tung ra thị trường vào năm 2010. Chanel giới thiệu phiên bản nâng cao của nó, Bleu de Chanel Eau de Parfum , vào mùa hè năm 2014. Hương thơm dành riêng cho sự tự do vô tận, sâu sắc và vô biên.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (7, N'Acqua Di Gio Profumo', 2750000.0000, N'Gio-profumo-1-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Acqua Di Gio Profumo , tao nhã, thoáng mát và sâu. Hương thơm tượng trưng cho sự hợp nhất của sóng biển với đá đen. Acqua di Gio Profumo là một thành phần thủy sinh, thơm, gỗ và cay, giống như bản gốc, có chữ ký của Alberto Morillas . Nó mở ra với cây thủy sinh tươi và cam bergamot. Trái tim của nó ghi lại những giai điệu thơm của hoa phong lữ, cây xô thơm và cây hương thảo, được đặt trên nền của hoắc hương và hương.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (8, N'Ultra Male', 3300000.0000, N'la-male-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Jean Paul Gaultier ra mắt nước hoa mới Ultra Male vào mùa hè năm 2015. Nước hoa này là phiên bản tái hiện hoặc phiên bản nâng cao của Le Male từ năm 1995. Ultra Male , được biết đến là nam tính, mãnh liệt, quyến rũ và đồng thời tinh tế. Ultra Male chẳng khác gì một mùi hương mê hoặc người đối diện, và tôi nhấn nhá chữ người đối diện bởi có lẽ với giới tính nào, gã này cũng hút được hết sảy. Nam, nữ hay là giới tính thứ 3, tất cả đều phải ngoái đầu lại, ném ánh mắt chằm chằm khi Ultra Male đi ngang qua, và cũng chỉ cần 1 đến 2 cú xịt thôi, nó đủ đốn gục mọi thứ xung quanh bạn rồi.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (9, N'Moschino Toy Boy', 1900000.0000, N'Moschino-Toy-Boy.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Được chuyên gia nước hoa hàng đầu Yann Vasnier sáng tạo ra, Moschino Toy Boy thể hiện được đầy đủ sự tinh quái của ông cách tạo hương của ông, khi hương đầu là sự kết hợp mới lạ giữa sự tươi mát của Cam bergamot, trái lê và vị ấm nồng của hồng tiêu. Và mặc dù là nước hoa nam, trái tim của Toy Boy lại phủ đầy các note hương hoa đầy quyến rũ. Toy Boy thể hiện được sự trầm ngâm và nam tính nhất khi yên vị trên da ở tầng hương cuối, nơi có sự giao thoa mạnh mẽ giữa cỏ Vetiver và hương gỗ Cashmeran. Được đánh giá là một chai nước hoa khó phán đoán và xác định được các tầng hương cụ thể, Toy Boy còn gây ấn tượng mạnh với thiết kế đậm chất lạ của Moschino.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (10, N'CLIVE CHRISTIAN ORIGINAL COLLECTION X MASCULINE EDITION', 9500000.0000, N'Clive-X-Masculine-600x702.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Khi xịt Clive X Masculine ra sẽ có cảm giác nhiều quế, xen lẫn citrus từ dứa và chanh, một chút mùi gợi cảm giác xanh xanh tới từ đại hoàng và nếu tôi không nhầm thì có chút hoa tím ở đó nữa. Chính ra thì nó là một cái opening ngửi không quá nịnh mũi, tôi còn có một người bạn còn bảo mùi này xịt ra hình như hơi giống thuốc bắc! Tôi không ưng cái opening này lắm, ngửi sẽ hơi lạ và ít gặp trong nước hoa, nhưng đến mức ngửi giống thuốc bắc thì không phải. Và thường người ta nói, “Good things take time”, tôi thấy cái này đúng nhất với nước hoa. Càng biến chuyển về sau, mùi hương càng trở nên nam tính, nịnh mũi và trưởng thành. Gỗ tuyết tùng làm nền cho quế và hổ phách hòa quyện với nhau toát lên sự nam tính, và có lẽ muốn cho mùi hương tưởng thành hơn hẳn và có chút gì đó gợi cảm giác sartorial nên perfumer Geza Schoen đã cho thêm vào đó là rêu sồi và cỏ hương bài để hoàn thiện mùi hương này. Tôi luôn thích cách Geza Schoen điều chế mùi hương, ông đã cho ra những chai nước hoa cực kì thành công như là Molecule 01 hay Ormonde Jayne Montabaco, Qi,.. và tôi cho rằng đây cũng là một chai cũng cực kì thành công nữa.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (11, N'Noir EDP', 3150000.0000, N'888066015509-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Sau dòng nước hoa Violet Blonde, Tom Ford cho ra mắt một mẩu nước hoa mới – Tom Ford Noir, với hương thơm và thiết kế mang đậm vẻ mạnh mẽ, bí ẩn, đặc biệt vô cùng thơm mát, cay nồng. Tất cả tạo nên một chai nước hoa thanh lịch, nam tính, chứa đựng nhiều bất ngờ. Đây được xem là chai nước hoa mang bước đột phá lớn của Tom Ford. Hương thơm khởi đầu với mùi hương của cam Bergamot, hồ tiêu hồng và hồ tiêu. Sau một khỏang thời gian, mùi hương lắng dần và định hình thành một mùi hương ngọt ngào vani và nhựa cây mang vị mặn. Hương thơm toát ra vẻ hào phóng, đầy tao nhã do sự góp mặt của hổ phách, nhờ hoắc hương làm cho tổng thể mùi hương trở nên ấm áp, thơm mùi thảo dược thanh mát. Nước hoa đem lại hương hoa tươi tắn, mang lại một cảm giác lôi cuốn ngọt ngào. Hương cuối còn lưu lại đó thật tuyệt vời với tinh chất đầy quyến rũ, gợi cảm, vương vấn mãi không thôi. Tất cả cảm giác hương cuối mang lại đều là nhờ vào nét hoang dại, táo bạo mà tổ hợp hương mang lại, ngoài ra nhựa thơm và các loại gia vị được hòa quyện với mùi hương của thân thảo, làm cho nước hoa trở nên ấm áp và mang hương vị đất. Đây là mẫu nước hoa sang trọng, mang đậm phong cách cổ điển, tuyệt vời nhất mà Tom Ford có thể mang lại. Tinh chất như bột mịn quấn quýt quanh cơ thể, với hương thơm của gỗ và xạ hương, đầy quyến rũ, cuốn hút. Noir mang thiết kế thân chai hộp vuông thanh lịch, cổ điển, với màu đen tuyền huyền bí, chứa đựng tinh chất nước hoa đầy gợi cảm, thể hiện được phong thái mạnh mẽ, nam tính của Tom Ford.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (12, N'1 Million EDT', 2650000.0000, N'818762150_818762240_1_1_720x928-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'1 Million EDT của Paco Rabanne thuộc nhóm Woody Spicy (Hương gỗ cay nồng) được cho ra mắt vào năm 2008. Nước hoa nam 1 Million EDT phù hợp nhất với các chàng trai trên 25 tuổi.Đây là dòng nước hoa có độ lưu hương rất lâu – trên 8 giờ. 1 Million EDT phù hợp để sử dụng trong cả ngày lẫn đêm vào mùa thu, đông.Bên cạnh đó, Quế, Hổ Phách và Da Thuộc là ba mùi hương bạn có thể dễ dàng cảm nhận được nhất khi sử dụng nước hoa này.', 1)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (13, N'Santal Blush', 5800000.0000, N'afa315528ab34622c4184e035cc662f0-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Thương hiệu Tom Ford đã giới thiệu 3 sản phẩm nước hoa mới mang tên: Jasmine Rouge, Violet Blonde và Santal Blush nằm trong bộ sưu tập mới New makeup collection vào tháng 9 năm 2011. Được tạo ra bởi chuyên gia danh tiếng Yann Vasnier, Jasmine Rouge sẽ mang đến mùi gỗ cay nồng đầy say mê, bí ẩn và sang trọng với nốt gỗ đàn hương và gia vị giữ vai trò chủ đạo. Lớp hương đầu của Santal Blush khá bình thường và tự nhiên: đanh, khô ráo và thơm mùi nhựa cây với các nốt hương trầm và thì là. Thời gian dần trôi qua và sự sắc nét ban đầu càng trở nên lặng lẽ, sự ngọt ngào của quế và hoa hồng bắt đầu được hé lộ, kéo theo nốt gỗ đàn hương đang di chuyển một cách lề mề và chậm chạp để cùng lấp đầy những khoảng trống lạnh lẽo với chút ấm áp và mềm mại. Cuối cùng sẽ là hỗn hợp gỗ oud và da thuộc đậm mùi khói và khô ấm, cuốn theo những bông hoa lài và hoa ngọc lan tây mềm mại, mỏng manh và trong khi đó xạ hương gợi cảm dần được châm ngòi và sau đó tất cả cùng bùng nổ theo cách đầy mãnh liệt và nổi bật.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (14, N'Good girl', 2900000.0000, N'b069aebb48f0e6b77d6295d5ff48ef97-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Good Girl được cho ra mắt vào năm 2016 của hãng Carolina Herrera. Hương thơm của Good Girl thuộc nhóm Oriental Floral (Hương hoa cỏ phương đông) hướng đến độ tuổi trên 25 tuổi. Louise Turner chính là nhà pha chế ra loại nước hoa này. Good Girl có độ lưu hương lâu – 6 giờ đến 12 giờ và độ tỏa hương thuộc dạng xa. Good Girl phù hợp để sử dụng trong cả ngày lẫn đêm vào mùa thu, đông. Bên cạnh đó, Đậu Tonka và Hoa huệ trắng là hai hương bạn có thể dễ dàng cảm nhận được nhất khi sử dụng nước hoa này.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (15, N'J’adore Eau de Parfum', 3500000.0000, N'2103043-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Dior J’adore Eau De Parfum Women là loại nước hoa mang hương thơm vô cùng đặc biệt, tạo dấu ấn ban đầu dễ dàng với bất kỳ đối tượng nào. Dior J’adore Eau De Parfum Women được chế tác vô cùng tinh xảo đến từ chi tiết cuối cùng ví như hương vị của bông hoa có trong tự nhiên.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (16, N'Bloom Acqua Di Fiori', 2400000.0000, N'Bloom-acqua-Di-Fiori-EDT-1-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Giống như Gucci Bloom, phiên bản mới được tạo ra bởi nhà chế tạo nước hoa Alberto Morillas , người đã lấy thành phần hương hoa tinh tế ban đầu của hoa huệ, hoa nhài và hoa kim ngân Trung Quốc (cây leo Rangoon), cây nho có hoa màu đỏ được công chiếu trong nước hoa, và làm cho nó tươi hơn bằng cách giới thiệu các hiệp ước xanh lá. Hương cuối là gỗ và xạ hương, được thực hiện để truyền đạt sự ấm áp và sâu sắc. Nó được cho là một hương thơm mạnh mẽ và rạng rỡ, hương lá xanh nhẹ và hoa của các thành phần tập trung cao độ. Hương thơm mới hứa hẹn một nhân vật sống động, tràn đầy sức sống và tươi mới hơn, lấy cảm hứng từ tình bạn giữa phụ nữ, sinh ra từ sự tự phát và niềm vui trẻ trung.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (17, N'Nomade', 2500000.0000, N'nomade-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Nomade là hương thơm mới nhất được Chloé giới thiệu vào năm 2018, không chỉ là một dòng nước hoa mới mà đó còn được xem là thời đại phong cách đầy nổi loạn khác biệt với những gì mà Chloé đã từng làm trước đó. Nhà sáng tạo ra loại nước hoa này muốn mang đến một tinh thần gì đó thật đậm sắc, ấn tượng mà vẫn nữ tính cho người sử dụng với lời kêu gọi mọi cô gái hãy thoát khỏi những điều gò bó bản thân để thoải mái tận hưởng không gian bao la của cuộc sống. Lọ nước hoa này được thiết kế với hình dáng của một chiếc túi lữ hành với những chi tiết da thuộc đầy cảm hứng. Từ mùi hương cho đến vẻ ngoài đều khiến những ai khoác lên mình Chloé Nomade đều nhận ra được niềm vui và khát vọng của bản thân, niềm mong mỏi vượt mọi hành trình để tìm về bản năng của riêng người phụ nữ.  ', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (18, N'Daisy Dream', 2850000.0000, N'daisydream-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Marc Jacobs ra mắt Daisy Dream vào mùa hè năm 2014 như một biến thể mới của nước hoa Daisy nguyên bản từ năm 2007. Daisy Dream là phiên bản tinh vi và thanh tao hơn so với bản gốc. Các thành phần có xu hướng tạo ra một hiệu ứng màu xanh da trời, được làm từ hương hoa và trái cây khác thường. Có sự kết hợp của quả mâm xôi, lê, wisteria xanh, hoa nhài và nước dừa. Mùi hương, giống như bản gốc, được tạo ra bởi nhà sáng chế nước hoa Alberto Morillas , hợp tác với Ann Gottlieb và chính nhà thiết kế Marc Jacobs .', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (19, N'Lys 41', 6600000.0000, N'41-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Lys 41 của Le Labo là một loại nước hoa dành cho phụ nữ. Lys 41 được ra mắt vào năm 2013. Đây là dòng nước hoa Le Labo thuộc nhóm Floral (Hương hoa cỏ). Bên cạnh đó, Hoa huệ và Hoa huệ trắng là hai hương bạn có thể dễ dàng cảm nhận được nhất khi sử dụng nước hoa này.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (20, N'Chanel Chance Eau Tendre EDT', 3600000.0000, N'eau-tendre-edt-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Chance Eau Tendre là phiên bản nước hoa mới của thương hiệu Channel, mang lại luồng gió mới cho các dòng sản phẩm nước hoa Chance. Mùi hương tinh tế mang đậm chất thơ, với hương thơm trái cây hòa quyện với hương hoa thanh khiết, tuy nhẹ nhàng nhưng vẫn toát lên được vẻ sống động như những làn sóng xanh êm diệu. Cha đẻ của chai nước hoa này là Jacques Polge. Chance Eau Tendre được ra mắt vào năm 2010. Cảm nhận đầu tiên về Chance Eau Tendre là hương thơm nồng nàn của bưởi và mộc qua, nhờ vào hương mộc qua mà hương đầu không quá gắt. Hương bưởi tạo cảm giác thanh mát, thoang thoảng hương hoa nồng nàn của huệ dạ hương. Mùi hương đầu thơm ngát và ấn tượng nhưng sẽ phai đi sau vài phút. Lúc này, hương trái cây sẽ lắng dần đi, chỉ còn đọng lại đó là hương hoa tươi mát. Hương bưởi, mộc qua hòa quyện với tinh dầu hoa nhài, được làm ấm lên bởi mùi hương đẫy đà và nữ tính của xạ hương trắng.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (21, N'Jean Paul Gaultier So Scandal', 3200000.0000, N'5fbb2dc11fdad-23112020103425-removebg-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Sau thành công của nước hoa Scandal, vào năm 2020, hãng nước hoa Jean Paul Gaultier tiếp tục cho ra mắt phiên bản So Scandal với hương tổng thể nồng nàn hơn, sâu lắng hơn, hứa hẹn mang đến nhiều bất ngờ thú vị cho các nàng.
Nước hoa nữ Jean Paul Gaultier So Scandal được lấy cảm hứng từ người phụ nữ thanh lịch nhưng có nhiều nét cá tính của người phụ nữ hiện đại, mạnh mẽ. Thành phần hương chính khá đa dạng với các loại hoa nhài sambac, hoa huệ mang đến nét đẹp thanh lịch, tinh tế nhưng cũng rất thời thượng. Phúc bồn tử hòa quyện với hương sữa ngọt ngào rất khó lẫn lộn với những mùi hương khác, vừa mang đến sự bùng nổ vừa đem lại dư vị sâu lắng, đam mê khó cưỡng lại. Vẫn giữ lại thiết kế độc đáo như phiên bản Scandal cũ, So Scandal có thêm các đường sọc nổi dọc thân chai, đem đến cảm giác sành điệu, bắt mắt hơn. Nắp chai vẫn có hình dáng đôi chân thon dài quyến rũ quen thuộc, như một biểu tượng rất thu hút của dòng nước hoa này.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (22, N'Moschino Toy 2', 2000000.0000, N'Moschino-Toy-2-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Nếu bạn đang tìm một mùi hương dành cho mùa hè, nhưng cảm thấy không quá ấn tượng với những mùi hương tươi mát với tone mùi chủ đạo là cam, quýt hay bưởi, thì Moschino Toy 2 sẽ giúp bạn trả lời được câu hỏi đó. Moschino Toy 2 tô điểm cho mùa hè của bất kỳ cô gái nào, biến sự nóng nực, khó chịu trở nên tươi mát và dễ chịu, nhưng vẫn đủ độ ngọt thanh nhẹ để khiến bạn cảm thấy tự tin, cuốn hút và nổi bật trước mọi không gian và thời gian. Sự hòa quyện tuyệt vời của Táo xanh cùng Lý chùm trắng, nữ tính với sự có mặt của Hoa mẫu đơn, cùng sự nhẹ nhàng và đầy sáng tạo khi kết hợp Hoa mộc làn cùng với xạ hương, Moschino Toy 2 sẵn sàng biến mùa hè của bạn trở thành những khoảnh khắc tuyệt đẹp không bao giờ quên.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (23, N'Armaf Club de Nuit Woman', 1600000.0000, N'Armaf-Club-de-Nuit-Woman-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Nước hoa nữ Armaf Club de Nuit Woman EDP là bản dupe tuyệt hảo của Chanel Coco Mademoiselle. Mùi hương dịu dàng nhưng sang chảnh, quyến rũ đặc trưng, ngửi phát là biết chỉ có thể xuất hiện trên cơ thể của những quý cô thanh lịch nhà Chanel. Hương đầu là cam bergamot, bưởi, đào. Nốt hương giữa là sự hòa trộn tinh tế của hoa phong lữ, hoa nhài, hoa hồng và vải thiều. Nốt hương cuối là hoắc hương, xạ hương, vanilla và cỏ vertiver. Hương thơm này được các chuyên gia đánh giá tương tự như đàn chị Chanel Coco Mademoiselle đã lừng danh bấy lâu nay với giá rẻ hơn rất nhiều. Armaf Club De Nuit Women thể hiện một hương thơm tinh tế dành cho người phụ nữ với mùi hương đặc trưng của trái cây và bạc hà. Đó là một biểu hiện của sự sang trọng và quyến rũ khó cưỡng.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (27, N'La Nuit Trésor Nude', 3100000.0000, N'lanuitnude.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'La Nuit Tresor Nude by Lancome là một loại nước hoa dành cho phụ nữ. Đây là một hương thơm mới. La Nuit Tresor Nude được ra mắt vào năm 2020. Hương đầu là bergamot,hương giữa là hoa hồng; Hương cuối là dừa và vanila.', 3)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (28, N'Parfums de Marly', 5500000.0000, N'1743-2-600x800.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Nước hoa unisex Layton được cho ra mắt vào năm 2016. Đây là dòng nước hoa Parfums de Marly thuộc nhóm Oriental Floral (Hương hoa cỏ phương đông) hướng đến độ tuổi trên 25 tuổi. Hamid Merati-Kashani chính là nhà pha chế ra loại nước hoa này. Layton có độ lưu hương lâu – 6 giờ đến 12 giờ và độ tỏa hương thuộc dạng xa – toả hương trong vòng bán kính 2 mét. Layton phù hợp để sử dụng trong cả ngày lẫn đêm vào mùa xuân, thu, đông. Bên cạnh đó, Hương Va ni và Quả táo xanh là hai hương bạn có thể dễ dàng cảm nhận được nhất khi sử dụng nước hoa này.', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (29, N'Grey Vetiver', 3500000.0000, N'XXIV-Gray-Vetiver-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Thương hiệu Tom Ford đã cho ra mắt một mùi hương dành cho nam giới mới với tên gọi Grey Vetiver vào tháng 9 năm 2009. Với hương cỏ hương bài giữ vai trò chủ đạo, Grey Vetiver sẽ được tô điểm thêm với các hương mang vị mặn và hương gỗ ấm áp.. Trong Tom Ford Grey Vetiver, nhân vật chính là cỏ hương bài được chế tác để mang lại sự tươi mát và hấp dẫn – vừa cổ điển, sang trọng, táo bạo và đầy nam tính. Hương cỏ hương bài sẽ dần xuất hiện từ đằng sau cánh gà cho đến nơi sân khấu chính và tiếp tục phát triển từ lớp hương đầu cho đến lớp hương nền. Và hương cỏ này được lấy ra theo một cách chiết xuất mang tính cách mạng. Lớp hương đầu khá tươi mát với hỗn hợp hoa cam, bưởi chùm và xô thơm, dần cuốn theo một lớp màng ấm áp bao bọc của các nốt hương gỗ và làm sống động lớp hương giữa. Nguồn năng lượng tràn đầy đang dần tỏa ra với hỗn hợp cây orris, đậu khấu và ớt pimento. Một làn hương gỗ hổ phách vàng óng ả dẫn mùi hương đến lớp hương cuối đậm đà và hấp dẫn. Rêu sồi mang lại hương xanh tự nhiên và gỗ, chính hương liệu này đã hoàn chỉnh sự hài hòa của nước hoa, tạo cảm giác mát lạnh, nhưng cũng đồng thời mùi hương dường như tan chảy vào thân nhiệt tự nhiên.', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (30, N'Mancera So Blue', 2800000.0000, N'mancera-so-blue_2ef511ea44a5476fbb501e4e02bd1319_master-600x600.jpg', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'So Blue được mở đầu với các mùi hương trái cây tươi mát như Chanh, Cam, Quýt được hòa quyện đặc sắc với hương Tiêu và vị ngọt của Trái cây. Tầng hương giữa mở ra với các nốt chủ đạo là hoa, bao gồm hoa Hồng Bulgary, hoa Tím, tô đậm hơn với mùi hương của Biển và Hoắc hương. Kết thúc cuộc dạo chơi đầy mùi hương là những nốt hương ấm áp ở phần cuối như Hổ phách, Xạ hương, Vani…So Blue được ví như một ly Soda hoa quả ngon ngọt, mát lịm bên cạnh bờ biển xanh mà ai ai cũng muốn thưởng thức', 2)
INSERT [dbo].[SANPHAM] ([id], [TENSP], [DONGIA], [HINHANH], [NGAYDANG], [MOTA], [IDLOAI]) VALUES (31, N'Philosykos', 3200000.0000, N'philosykos-eau-de-toilette-100ml-311-600x600.png', CAST(N'2021-06-01 00:00:00' AS SmallDateTime), N'Philosykos là một mùi hương nước hoa thuộc dòng hương gỗ thơm ngát dành cho cả nam lẫn nữ của hãng Diptyque. Mùi hương được cho ra mắt vào năm 1996, nhờ vào chiếc mũi tài hoa Olivia Giacobetti. Hương đầu là lá sung và quả sung; hương giữa là dừa và hương của cỏ cây xanh tươi; và lớp nền là tuyết tùng, hương gỗ và cây sung. Mẫu thiết kế chai khá đơn giản với hình vuông được với những góc chai dũa thành những đường cong gọn gàng, thân chai làm bằng thủy tinh trong suốt lộ rõ dung dịch nước hoa màu nhạt bên trong. Nắp chai màu đen tuyền với hình trụ tròn, như là điểm nhấn cho tổng thể hình ảnh chai. Một trong những mùi hương tuyệt vời nhất về quả sung từng được chế tạo, và cũng là một trong những chai nước hoa được yêu thích nhất dù qua bao năm tháng. Philosykos như một án thơ tuyệt hay để ca ngợi những cây sung của Hy Lạp. Dưới bàn tay của nhà điều chế nước hoa Olivia Giacobetti, đây là một mùi hương của sung rất tự nhiên và xanh tươi – một mùi hương của những quả sung vừa chín tới đang chờ thu hoạch.', 2)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([id], [name], [email], [phone], [address], [password], [created]) VALUES (27, N'Nguyễn Sỹ Trường', N'sytruong61@gmail.com', N'0343219012', N'Quận 9, Thành Phố Hồ Chí Minh', N'pleiku2019*', CAST(N'2021-05-21 00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[USERS] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_LOAI]    Script Date: 01/06/2021 19:30:29 ******/
ALTER TABLE [dbo].[LOAI] ADD  CONSTRAINT [UK_LOAI] UNIQUE NONCLUSTERED 
(
	[TENLOAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_LOAI]    Script Date: 01/06/2021 19:30:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_LOAI] ON [dbo].[LOAI]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_SANPHAM]    Script Date: 01/06/2021 19:30:29 ******/
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [UK_SANPHAM] UNIQUE NONCLUSTERED 
(
	[TENSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_USERS]    Script Date: 01/06/2021 19:30:29 ******/
ALTER TABLE [dbo].[USERS] ADD  CONSTRAINT [UK_USERS] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_DONHANG] FOREIGN KEY([DH_ID])
REFERENCES [dbo].[DONHANG] ([id])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [FK_CTDH_DONHANG]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_SANPHAM] FOREIGN KEY([SP_ID])
REFERENCES [dbo].[SANPHAM] ([id])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [FK_CTDH_SANPHAM]
GO
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONHANG_USERS] FOREIGN KEY([user_id])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[DONHANG] CHECK CONSTRAINT [FK_DONHANG_USERS]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_LOAI] FOREIGN KEY([IDLOAI])
REFERENCES [dbo].[LOAI] ([id])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_LOAI]
GO
/****** Object:  StoredProcedure [dbo].[SP_HIENTHI]    Script Date: 01/06/2021 19:30:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_HIENTHI]
AS
	SELECT * FROM dbo.users 

GO
USE [master]
GO
ALTER DATABASE [WEBBANHANG] SET  READ_WRITE 
GO
