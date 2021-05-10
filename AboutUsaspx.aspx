<%@ Page Title="" Language="C#" MasterPageFile="~/Home1.Master" AutoEventWireup="true" CodeBehind="AboutUsaspx.aspx.cs" Inherits="GargeManger.AboutUsaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>אודתנו</title>
    <link href="imegas\faviconabout.ico" rel="icon" type="image/x-icon" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link href="css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="css/jcarousel.css" rel="stylesheet" />
  <link href="css/flexslider.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />
  <!-- Theme skin -->
  <link href="skins/default.css" rel="stylesheet" />
  <!-- boxed bg -->
  <link id="bodybg" href="bodybg/bg1.css" rel="stylesheet" type="text/css" />
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/a<link rel="shortcut icon" href="ico/favicon.png" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContein" runat="server">
     <section id="content">
      <div class="container">
        <div class="row">
          <div class="span6">
            <h2>מערכת<strong> MYgarge </strong></h2>
            <p>
             תוכנה לניהול מוסך  ומלאי
הבחירה של יבואני הרכב בישראל תוכנה קלה ופשוטה לתפעול
 המשתמשים הרבים בתוכנת לניהול מוסך מאמצים אותה ,כי היא פשוטה ואמינה בתפעול היומיומי.
            </p>
            <p>
             בתוכנה לניהול מוסך אפשר לעצב עיצוב ראשוני מהיר ע"פ דרישות המשתמש ,
 בכך נחסכים למשתמש הקשות מיותרות והתפעול מהיר ונוח.
כדי שהמשתמש יוכל לבצע פעולות מהירות מכל מקום בתוכנה, תוכנת לניהול מוסך מאפשרת גישה באמצעות מקשים "חמים" 
 או כפתורים במסך הראשי לרוב הפעולות הנעשות בתוכנה.
            </p>
            <p>
              כרטיס העבודה הוא "לב המערכת" בתפעול היומיומי.
 זהו המסך הפעיל ביותר למשתמש במוסך.
 ולכן ממסך זה אפשר לבצע כמעט כל פעולה יומיומית הכרחית
 ,כמו הקמת לקוח , הקמת רכב ,הוספת סוג רכב או דגם רכב
 ,צפיה בהיסטוריה של הרכב ,צפיה בכרטיס הנה"ח של הלקוח ,הדפסת העתק של חשבונית ועוד

            </p>
          </div>
          <div class="span6">
            <!-- start flexslider -->
            <div class="flexslider">
              <ul class="slides">
                <li>
                    <img src="abouus/support_main.png" />
                
                </li>
                <li>
                    <img src="abouus/update_main.png" />
                </li>
                <li>
                    <img src="abouus/ניהול.jpg" />
                </li>
              </ul>
            </div>
            <!-- end flexslider -->
          </div>
        </div>
        <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider -->
        <div class="row">
          <div class="span12">
            <h4>אנשי הצוות שלנו</h4>
          </div>
          <div class="span3">
            <img src="imegas/speaker-3.jpg" alt="" class="img-polaroid" />
            <div class="roles">
              <p class="lead">
                <strong>Isayas Gadlo</strong>
              </p>
              <p>
                CEO - Founder
              </p>
            </div>
          </div>
          <div class="span3">
            <img src="imegas/speaker-4.jpg" alt="" class="img-polaroid" />
            <div class="roles">
              <p class="lead">
                <strong>Tommy Laugher</strong>
              </p>
              <p>
                Lead designer
              </p>
            </div>
          </div>
          <div class="span3">
            <img src="imegas/speaker-6.jpg" alt="" class="img-polaroid" />
            <div class="roles">
              <p class="lead">
                <strong>Gabirelle Borowski</strong>
              </p>
              <p>
                Customer support
              </p>
            </div>
          </div>
          <div class="span3">
            <img src="imegas/speaker-5.jpg" alt="" class="img-polaroid" />
            <div class="roles">
              <p class="lead">
                <strong>Benny Strongton</strong>
              </p>
              <p>
                Coffee maker
              </p>
            </div>
          </div>
        </div>
        <!-- divider -->
        <div class="row">
          <div class="span12">
            <div class="solidline">
            </div>
          </div>
        </div>
        <!-- end divider -->
        <div class="row">
          <div class="span6">
            <h4>פרטים בקטנה עלינו:</h4>
            <div class="accordion" id="accordion2">
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
							1. מה אנחנו עושים </a>
                </div>
                <div id="collapseOne" class="accordion-body collapse in">
                  <div class="accordion-inner">
                    <p>
                      Diam alienum oporteat ad vis, latine intellegebat cu his. Ei eros dicam commodo duo, an assum meliore eam. In sed albucius dissentiet. Sit laudem graece malorum ne, at eam omnesque expetenda pertinacia, tale meliore vim ea. Dolore legere deleniti ius
                      at, mea nibh discere perfecto ex. Mea ea iuvaret eripuit, eos no vivendo intellegat definiebas, patrioque eloquentiam eos et.
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
							2. תהליכי עבודה </a>
                </div>
                <div id="collapseTwo" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                      Nihil suscipit posidonium eos id. An cetero fierent insolens mel, ex sit rebum falli erroribus. Ius in nemore dolorum officiis. Et vel harum dicant, vix eius persius an. Ex eam malis postea, erat nihil consulatu nam ea. Ex quem dolores euripidis eum,
                      tempor aperiam voluptaria has ad. Ea est persecuti dissentiet voluptatibus, at illum malorum minimum usu eum aeterno tritani.
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseThree">
							3. איכות השירות </a>
                </div>
                <div id="collapseThree" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                      Vel purto oportere principes ne, ut mel graeco omnesque. Habeo justo congue mei cu, eu est molestie sensibus, oratio tibique ad mei. Admodum consetetur cu eam, nec cu doming prompta inciderint, ne vim ceteros mnesarchum scriptorem. Ex eam malis postea,
                      erat nihil consulatu nam ea. Ex quem dolores euripidis eum, tempor aperiam voluptaria has ad. Et vel harum dicant vix.
                    </p>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseFour">
							4. המטרה שלנו </a>
                </div>
                <div id="collapseFour" class="accordion-body collapse">
                  <div class="accordion-inner">
                    <p>
                      Diam alienum oporteat ad vis, latine intellegebat cu his. Ei eros dicam commodo duo, an assum meliore eam. In sed albucius dissentiet. Sit laudem graece malorum ne, at eam omnesque expetenda pertinacia, tale meliore vim ea. Dolore legere deleniti ius
                      at, mea nibh discere perfecto ex. Mea ea iuvaret eripuit, eos no vivendo intellegat definiebas, patrioque eloquentiam eos et.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="span6">
            <h4>המומחיות שלנו</h4>
            <label>ניהול בסיסי נתונים</label>
            <div class="progress progress-info progress-striped active">
              <div class="bar" style="width: 100%">
              </div>
            </div>
            <label>מעקב אחר לקוחות</label>
            <div class="progress progress-success progress-striped active">
              <div class="bar" style="width: 100%">
              </div>
            </div>
            <label>שירות לקוחות 24/7</label>
            <div class="progress progress-warning progress-striped active">
              <div class="bar" style="width: 100%">
              </div>
            </div>
            <label>ניהול מלאי</label>
            <div class="progress progress-danger progress-striped active">
              <div class="bar" style="width: 100%">
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
</asp:Content>
