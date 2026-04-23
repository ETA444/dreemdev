require ["include", "environment", "variables", "relational",
         "comparator-i;ascii-numeric", "spamtest", "fileinto"];

# Generated: Do not run this script on spam messages
if allof (environment :matches "vnd.proton.spam-threshold" "*",
          spamtest :value "ge" :comparator "i;ascii-numeric" "${1}")
{
    return;
}

###############################################################################
# Studix – Dev (Pragmatic Engineer, GitHub, DataCamp, Google dev/AI, etc.)
###############################################################################

if anyof (
  header :contains "from" [
    "pragmatic engineer",
    "hello@pragmaticengineer.com",
    "newsletter.pragmaticengineer.com",
    "github education",
    "github campus",
    "github classroom",
    "github",
    "datacamp",
    "google developers",
    "google developer",
    "google ai studio",
    "google ai",
    "google cloud",
    "google for developers",
    "gemini for developers",
    "gcp newsletter"
  ],
  header :contains "subject" [
    "The Pragmatic Engineer",
    "Pragmatic Engineer",
    "GitHub Education",
    "GitHub Campus",
    "GitHub Classroom",
    "DataCamp",
    "Google AI Studio",
    "Google AI",
    "Google Cloud",
    "Google for Developers",
    "Gemini for developers",
    "GCP newsletter"
  ]
)
{
  fileinto "Studix/Dev";
  stop;
}

###############################################################################
# Studix – Finance (CoinGecko, Binance, FT, crypto analytics, etc.)
###############################################################################

elsif anyof (
  header :contains "from" [
    "coingecko",
    "binance",
    "binance academy",
    "financial times",
    "ft.com",
    "ft newsletters",
    "marinade finance",
    "be[in]crypto",
    "beincrypto",
    "santiment",
    "santiment analytics",
    "symbiosis finance",
    "save finance",
	  "sentora research",
    "polymarket",
    "coinmarketcap",
    "defi",
    "onchain data",
	  "Trump Media & Technology Group"
  ],
  header :contains "subject" [
    "CoinGecko",
    "Binance Academy",
    "Binance Learn",
    "Financial Times",
    "FT newsletter",
    "FT Alphaville",
    "Marinade Finance",
    "BeInCrypto",
    "Santiment",
    "Symbiosis Finance",
    "Save Finance",
    "Polymarket",
    "crypto markets",
    "on-chain data",
    "onchain data",
    "DeFi update",
    "BTC",
	  "ETH"
  ]
)
{
  fileinto "Studix/Finance";
  stop;
}

###############################################################################
# Studix – Science (Medscape, Aeon, Quanta, Nature Briefing, Science X, etc.)
###############################################################################

elsif anyof (
  header :contains "from" [
    "medscape",
    "aeon",
    "aeon newsletter",
    "quanta magazine",
    "quanta.org",
    "nature briefing",
    "nature.com",
    "science x",
    "sciencex",
    "physorg",
    "medical news",
    "science daily",
	  "universetoday"
  ],
  header :contains "subject" [
    "Medscape",
    "Aeon Weekly",
    "Aeon newsletter",
    "Quanta Magazine",
    "Quanta",
    "Nature Briefing",
    "Nature newsletter",
    "Science X",
    "Phys.org",
    "Science news",
    "research highlights"
  ]
)
{
  fileinto "Studix/Science";
  stop;
}
