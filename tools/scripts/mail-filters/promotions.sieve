require ["include", "environment", "variables", "relational",
         "comparator-i;ascii-numeric", "spamtest", "fileinto"];

# Generated: Do not run this script on spam messages
if allof (environment :matches "vnd.proton.spam-threshold" "*",
          spamtest :value "ge" :comparator "i;ascii-numeric" "${1}")
{
    return;
}

###############################################################################
# Shopping / Promotions filter
###############################################################################

# Helper: skip transactional / important order-related emails
if allof (
  header :contains "subject" [
    "order confirmation",
    "your order",
    "order received",
    "order update",
    "order status",
    "order details",
    "shipping confirmation",
    "your package",
    "has shipped",
    "out for delivery",
    "delivery update",
    "delivery confirmation",
    "invoice",
    "receipt",
    "payment confirmation",
    "billing statement",
    "subscription updated",
    "subscription renewed"
  ],
  true   # explicit allof block even if only one test; easier to extend later
)
{
    # Do nothing: leave these in Inbox
    return;
}

if anyof (

  /* 1) Subject contains classic promo / sale language (non-transactional) */
  /* header :contains "subject" [
    "% off",
    "percent off",
    "off everything",
    "sitewide sale",
    "site-wide sale",
    "sale ends",
    "sale starts",
    "flash sale",
    "clearance",
    "last chance",
    "final hours",
    "final sale",
    "deal",
    "deals",
    "special offer",
    "offer ends",
    "offer expires",
    "limited time",
    "today only",
    "this weekend",
    "discount",
    "extra discount",
    "exclusive discount",
    "promo code",
    "promotion",
    "coupon",
    "voucher",
    "saving",
    "savings",
    "save now",
    "bogo",
    "buy one get one",
    "free shipping",
    "free delivery",
    "free gift"
  ], */

  /* 2) Clothing / streetwear / fashion sender domains (alphabetical, strict) */
  address :domain :is "from" [
    "aimeleondore.com",
	"arnodefrance.com",
    "alwaysdowhatyoushoulddo.com",
    "an-appendage.com",
    "antisocialsocialclub.com",
    "arte-antwerp.com",
    "askyurself.com",
    "bape.com",
    "brokenheartofficial.com",
	  "brokenplanet.com",
    "chaosgone.global",
    "corteiz.com",
    "crocs-email.com",
    "derschutze.com",
    "disarrayclth.com",
    "dividetheyouth.com",
    "dm.casio.info",
    "drovision.com",
    "email.houseoffraser.co.uk",
    "email.sportsdirect.de",
    "enternostalgia.com",
	"eu.youngla.com",
    "eu.supreme.com",
	"ekster.com",
    "fainz.de",
    "falsebranding.com",
    "fearofgod.com",
    "g.shopifyemail.com",
    "gallerydepartment.com",
    "glogangworldwide.com",
    "gnarcotic.com",
    "hellstar.com",
    "hippolytebrun.com",
    "hostbrand.es",
    "ironiedelamour.com",
    "kankanreallyrich.com",
    "kingspider.co",
    "krypt0wrld.com",
	"laarvee.com",
    "letmebeclear.eu",
    "livevlonedievlone.com",
    "losangelesarchive.com",
    "lostboysarchives.com",
    "mail.otrium.com",
    "mail.studio.co.uk",
    "michabilous.online",
    "monsternum.com",
    "moonlightmansion.com",
    "moremoneymorelove.de",
    "moistglobal.com",
    "mschf.com",
    "news.arcteryx.com",
    "news.ftshp.de",
    "news.plein.com",
    "news.secretsales.com",
    "news.vans.com",
	"nocta.com",
    "notbasic.de",
	"onvandylab.org",
    "octobersveryown.net",
    "palandra.com.pl",
	"pitviper.com",
    "psychwardusa.com",
    "rareeverywhere.com",
    "ransom.store",
    "representclo.com",
    "revenge.io",
	"reliked.com",
    "ridgewallet.eu",
    "section8official.com",
    "selectshop.eu",
    "shopcurse.com",
    "sidearts.fr",
    "supreme.com",
    "supremenewyork.com",
    "superrradical.com",
    "syna.store",
	"theharmonic.com.au",
    "trapstarlondon.com",
    "trendtvision.com",
    "vicinityclo.de",
    "viperr.world",
    "wasted.fr",
    "yeezy.com",
    "ye.yeezy.com"
  ],

  /* 3) Brand names (streetwear + big sneaker/fashion) in From or Subject */
  anyof (
    header :contains "from" [
      "aime leon dore",
      "aimeleondore",
	  "arnodefrance",
      "always do what you should do",
      "an-appendage",
      "antisocialsocialclub",
      "arte-antwerp",
      "askyurself",
      "bape",
      "brokenheartofficial",
      "casio",
      "chaosgone",
      "corteiz",
      "crocs",
      "derschutze",
      "disarrayclth",
      "dividetheyouth",
      "drovision",
      "enternostalgia",
      "supreme",
      "fainz",
      "falsebranding",
      "fear of god",
      "shopify",
      "gallery dept",
      "gallery department",
      "glogang",
      "glogangworldwide",
      "gnarcotic",
      "hellstar",
      "hippolytebrun",
      "hostbrand",
      "house of fraser",
      "sportsdirect",
      "ironiedelamour",
      "kankanreallyrich",
      "kingspider",
      "krypt0wrld",
      "letmebeclear",
      "los angeles archive",
	  "vandythepink",
      "vlone",
	  "laarvee",
      "lostboysarchives",
      "michabilous",
      "monsternum",
      "moonlightmansion",
      "moistglobal",
      "more money more love",
      "mschf",
	  "nocta",
      "notbasic",
	  "nubeo watches",
      "octobers very own",
      "ovo",
      "otrium",
      "palandra",
	  "palm angels",
	  "pit viper",
      "psychwardusa",
      "rareeverywhere",
      "ransom",
      "representclo",
      "represent",
      "revenge",
	  "reliked",
      "ridge wallet",
      "ridgewallet",
      "secretsales",
      "ftshp",
      "selectshop",
      "shopcurse",
      "sidearts",
      "superrradical",
      "syna",
	  "swarovski",
      "trapstar",
      "trapstarlondon",
      "trendtvision",
      "vicinityclo",
      "viperr",
      "wasted",
      "yeezy",
	  "young la",
	  "YoungLA",

      "nike",
      "adidas",
      "new balance",
      "jordan",
      "asics",
      "converse",
      "vans",
      "reebok",
      "puma",
      "stussy",
      "patta",
      "balenciaga",
      "amiri",
      "balmain",
      "arcteryx",
      "plein"
    ],
    header :contains "subject" [
      "aime leon dore",
      "aimeleondore",
      "always do what you should do",
      "an-appendage",
      "antisocialsocialclub",
      "arte-antwerp",
      "askyurself",
      "bape",
      "brokenheartofficial",
      "chaosgone",
      "corteiz",
      "crocs",
      "derschutze",
      "disarrayclth",
      "dividetheyouth",
      "drovision",
      "enternostalgia",
      "supreme",
      "fainz",
      "falsebranding",
      "fear of god",
      "shopify",
      "gallery dept",
      "gallery department",
      "glogang",
      "glogangworldwide",
      "gnarcotic",
      "hellstar",
      "hippolytebrun",
      "hostbrand",
      "house of fraser",
      "sportsdirect",
      "ironiedelamour",
      "kankanreallyrich",
      "kingspider",
      "krypt0wrld",
      "letmebeclear",
      "los angeles archive",
      "vlone",
      "lostboysarchives",
      "michabilous",
      "monsternum",
      "moonlightmansion",
      "moistglobal",
      "more money more love",
      "mschf",
	  "nocta",
      "notbasic",
      "octobers very own",
      "ovo",
      "otrium",
      "palandra",
      "psychwardusa",
      "rareeverywhere",
      "ransom",
      "representclo",
      "represent",
      "revenge",
      "ridge wallet",
      "ridgewallet",
      "secretsales",
      "ftshp",
      "selectshop",
      "shopcurse",
      "sidearts",
      "superrradical",
      "syna",
      "trapstar",
      "trapstarlondon",
      "trendtvision",
      "vicinityclo",
      "viperr",
      "wasted",
      "yeezy",
	  "youngla",
      "nike",
      "adidas",
      "new balance",
      "jordan",
      "asics",
      "converse",
      "vans",
      "reebok",
      "puma",
      "stussy",
      "patta",
      "balenciaga",
      "amiri",
      "balmain",
      "arcteryx",
      "plein"
    ]
  )

) {
  fileinto "Shopping/Promotions/Fashion";
  stop;
}


###############################################################################
# Shopping – Books (bookstores, publishers, book resellers)
###############################################################################

elsif anyof (
  header :contains "from" [
    "blackwell",
    "blackwells",
    "world of books",
    "worldofbooks",
    "lehmanns",
    "webuybooks",
    "we buy books",
    "awesomebooks",
    "awesome books",
    "better world books",
    "betterworldbooks",
    "bookdelivery",
    "book delivery",
	"ascendingflame"
  ],
  header :contains "subject" [
    "Blackwell",
    "World of Books",
    "Lehmanns",
    "WeBuyBooks",
    "We Buy Books",
    "AwesomeBooks",
    "Awesome Books",
    "BetterWorldBooks",
    "Better World Books",
    "BookDelivery",
    "Book Delivery"
  ]
)
{
  fileinto "Shopping/Promotions/Books";
  stop;
}

###############################################################################
# Shopping – Tech promos (Synology, Ardes, Technopolis, etc.)
###############################################################################

elsif anyof (
  header :contains "from" [
    "synology",
    "ardes",
	  "eufy",
    "technopolis",
    "techno polis",
    "pc store",
    "pcstore",
    "pc shop",
    "pcshop",
	  "stardock software",
    "software"
  ],
  header :contains "subject" [
    "Synology",
    "Ardes",
    "Technopolis",
    "PC store",
    "PC Store",
    "PC Shop",
    "PC shop"
  ]
)
{
  fileinto "Shopping/Promotions/Tech";
  stop;
}

###############################################################################
# Shopping – Supplement promos (5% Nutrition, Predator, NitroTiger, etc.)
###############################################################################

elsif anyof (
  header :contains "from" [
    "5% nutrition",
    "predator nutrition",
    "Nitrotiger.com",
    "sila bg",
    "fitness1",
    "ostrovit",
    "fitness",
    "bodybuilding",
	  "sneak energy",
    "iHerb",
    "Sneak",
	  "Cheeky"
  ],
  header :contains "subject" [
    "gym",
    "fitness",
    "supplements",
    "vitamin",
    "protein",
    "протеин",
	  "креатин",
	  "спорт"
  ]
)
{
  fileinto "Shopping/Promotions/Supps";
  stop;
}

###############################################################################
# Shopping – General promos (Amazon, eBay, Etsy, big / UAE e-com, toys, etc.)
###############################################################################

elsif anyof (

  # Big general e-commerce brands in From / Subject
  header :contains "from" [
    "amazon",
    "ebay",
    "etsy",
    "aliexpress",
    "zalando",
    "noon",
    "namshi",
    "6thstreet",
    "ounass",
    "carrefour",
    "dubai store",
    "dubai mall"
  ],

  header :contains "subject" [
    "Amazon",
    "eBay",
    "Etsy",
    "AliExpress",
    "Zalando",
    "noon",
    "Namshi",
    "6thStreet",
    "Ounass",
    "Carrefour",
    "apteka",
	  "аптека"
  ],

  # Promo language (re-using general patterns)
  header :contains "subject" [
	  "Вашето мнение относно закупуването на билети",
    "% off",
    "percent off",
    "off everything",
    "sitewide sale",
    "site-wide sale",
    "sale ends",
    "sale starts",
    "flash sale",
    "clearance",
    "last chance",
    "final hours",
    "final sale",
    "deal",
    "deals",
    "special offer",
    "offer ends",
    "offer expires",
    "limited time",
    "today only",
    "this weekend",
    "discount",
    "extra discount",
    "exclusive discount",
    "promo code",
    "promotion",
    "coupon",
    "voucher",
    "saving",
    "savings",
    "save now",
    "free shipping",
    "free delivery",
    "free gift",
	  "10%",
	  "15%",
    "20%",
    "25%",
    "30%",
	  "35%",
	  "40%",
	  "45%",
	  "50%",
	  "55%",
	  "60%",
    "65%",
    "70%",
    "75%",
	  "80%",
	  "85%",
	  "90%"
  ],

  # Other
  header :contains "from" [
    "the entertainer",
    "thetoyshop",
    "toy shop",
    "toy store",
	  "BeatStars",
    "info@tamian.bg",
    "Antoine de My American Shop",
    "Аптеки Гален",
	  "American Shop",
	  "Albion Online",
    "Albion",
    "Sleep Cycle",
    "Epic Games",
    "Attitude Holland",
    "Aquarelle Fleurs",
    "Arua",
    "EasyLunettes",
    "Tavex",
    "Lentiamo",
    "Coffeepadsbg",
	  "Coffee",
    "Swarovski",
    "Swarovski.com",
	  "Pudgy Penguins"

  ],
  header :contains "subject" [
    "The Entertainer",
    "TheToyShop",
    "Toy Shop",
	  "unread messages"
  ]
)
{
  fileinto "Shopping/Promotions/General";
  stop;
}
