# Bordro
Bu Türk yasalarına göre bordro hesaplaması yapacak bir program olacak. Delphi kullanacağım. Mümkün oldukça basit ve kullanımı kolay bir yapıda olması için çaba sarfedeceğim. Programlamada ise bazı şimdiye kadar kullanmadığım yollar izleyeceğim. Bunların en önemlisi MVVM tasarım kalıbı. Ayrıca formlar arası geçişte bağımsızlığı sağlamak için dependency injection tasarım kalıbını (zaten sistemini oluşturdum ve) kullanıyorum. Ayrıca ORM sistemi kullanmaya karar verdim ve Spring4d paketi içinde Marshmallow orm paketini kullanıyorum. 
Ve gelelim veritabanı kısmına... Bunun için de başlangıç olarak SQlite3 kullanmaya karar verdim. Aslında iyi ki de kullanmışım diyorum. Çok hızlı ve tekli kullanımda tüm ihtiyaçları karşılayan bir veritabanı.
Veritabanını sql üzerinden oluşturmuyorum. Tüm sınıfları, Bordro programında Model.Declarations.pas içinde tanımladım ve menüden VT'yi yaratı seçtiğimizde program veritabanını kendisi, tablolar arası ilişkilerle birlikte oluşturuyor.
İlerleyen dönemlerde DSharp paketini de bu programda kullanmayı düşünüyorum. 
MVVM için 3 ayrı bölüm tanımı var,

1. Model,
2. Viewmodel,
3. View

Model, bildiğimiz tablo sınıfı ve veritabanıyla program arasındaki ilişkiyi kuran kısım. View, bildiğimiz form. Yani sunum-gösterim kısmı. Bunlar zaten eskiden de vardı. Burada en muğlak kısım Viewmodel... Açıkçası formlarda event handler kullandığımız için ve pek çok işi event handler'larda yapmak zorunda kaldığımız için Viewmodel kısmı maalesef boş kalıyor. Çünkü event'lerdeki kodu Viewmodel'e taşımak çoğu durumda astarı yüzünden pahalıya gelen bir olay oluyor. İşte tam bu noktada DSharp işime yarayacak diye düşünüyorum. Çünkü kendisi aynen C# MVC yapısı gibi bir yapı kuruyor. Ana programda ViewModel'i biliyorsunuz, ViewModel'le View arasındaki ilişkiyi isimlerindeki aynılığa göre kendisi kurup View'u yani formu buluyor. Formun event'leri de ViewModel'de tanımlanabiliyor (yine isim benzerlikleri kullanılarak) ve tüm event'ler formun dışında ViewModel'e alınmış oluyor. Haliyle ViewModel sistemi ete-kemiğe bürünmüş oluyor, içi doluyor.

Bir sonraki adımı bunun FMX'le yapılması ve tüm mobil cihazlarda da çalışması olacak!

Kullandığım yazılım araçları da şunlar;
- Spring4d : Marshmallow orm için kullanıyorum. C# ve Entity Framework kullanıncaya kadar orm için pek olumlu düşünmüyordum. Ama hele ki bu programdan sonra, mutlaka kullanılması lazım. Hayatı çok kolaylaştırıyor.
- JCL ve JVCL (Jedi VCL paketi) : Grid, Form property saver, toolbar, Memory table gibi bileşenlerini kullanıyorum.
- DB Browser for SQLite : Veritabanı üzerinde çeşitli düzeltmeler yapmak, örnek veri girmek vs işler için.
