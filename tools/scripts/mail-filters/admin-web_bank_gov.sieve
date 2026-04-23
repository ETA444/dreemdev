require ["include", "environment", "variables", "relational",
         "comparator-i;ascii-numeric", "spamtest", "fileinto"];

# Generated: Do not run this script on spam messages
if allof (environment :matches "vnd.proton.spam-threshold" "*",
          spamtest :value "ge" :comparator "i;ascii-numeric" "${1}")
{
    return;
}

###############################################################################
# Admin – Web services (pCloud, Google, Proton, Cloudflare, Namecheap, Shopify)
###############################################################################

if allof (
  anyof (
    header :contains "from" [
      "pcloud",
      "google",
      "gmail",
      "proton",
      "proton mail",
      "cloudflare",
      "namecheap",
      "shopify"
    ],
    header :contains "subject" [
      "pcloud",
      "google",
      "gmail",
      "proton",
      "proton mail",
      "cloudflare",
      "namecheap",
      "shopify"
    ]
  )
)
{
  fileinto "Admin/Web";
  stop;
}

###############################################################################
# Admin – Dutch government (MijnOverheid, Berichtenbox, DigiD, DUO, Belastingdienst)
###############################################################################

elsif allof (
  anyof (
    header :contains "from" [
      "belastingdienst",
      "mijn overheid",
      "mijnoverheid",
      "berichtenbox",
      "overheid.nl",
      "digid",
      "duo",
      "mijn duo"
    ],
    header :contains "subject" [
      "Belastingdienst",
      "MijnOverheid",
      "Berichtenbox",
      "DigiD",
      "Mijn DUO"
    ],
    address :domain :is "from" [
      "belastingdienst.nl",
      "overheid.nl",
      "mijn.overheid.nl",
      "duo.nl",
      "digid.nl"
    ]
  ),
  true
)
{
  fileinto "Admin/Gov";
  stop;
}

###############################################################################
# Admin – Banking (ABN AMRO, Revolut, UniCredit Bulbank)
###############################################################################

elsif allof (
  anyof (
    header :contains "from" [
      "abn amro",
      "abn-amro",
      "revolut",
      "unicredit bulbank",
      "unicreditbulbank",
	    "venmo",
	    "robinhood"
    ],
    header :contains "subject" [
      "ABN AMRO",
      "Revolut",
      "UniCredit Bulbank",
	    "Venmo Quarterly Statement"
    ],
    address :domain :is "from" [
      "nl.abnamro.com",
      "abnamro.com",
      "revolut.com",
      "unicreditgroup.bg",
      "unicreditbulbank.bg",
	    "venmo.com",
	    "robinhood.com"
    ]
  )
)
{
  fileinto "Admin/Bank";
  stop;
}
