require ["include", "environment", "variables", "relational",
         "comparator-i;ascii-numeric", "spamtest", "fileinto"];

# Generated: Do not run this script on spam messages
if allof (environment :matches "vnd.proton.spam-threshold" "*",
          spamtest :value "ge" :comparator "i;ascii-numeric" "${1}")
{
    return;
}

###############################################################################
# Shopping – Invoices / Receipts / Payment confirmations (broad)
###############################################################################

if header :contains "subject" [
  "invoice",
  "tax invoice",
  "vat invoice",
  "pro forma invoice",
  "proforma invoice",
  "receipt",
  "payment receipt",
  "payment confirmation",
  "payment confirmed",
  "order receipt",
  "order confirmation",
  "your order receipt",
  "paid",
  "payment successful",
  "payment succeeded",
  "billing",
  "billing notice",
  "billing statement",
  "statement of account",
  "order statement",
  "payment due",
  "amount due",
  "balance due",
  "past due",
  "overdue",
  "reminder: invoice",
  "reminder: payment",
  "booking",
  "ordered",
  "appointment",
  "factuur",
  "betaling",
  "фактура",
  "фактури",
  "плащане",
  "касов бон",
  "платени",
  "неплатени",
  "сметка",
  "сметки",
  "ePay.bg",
  "pending bills",
  "Pending bills in ePay.bg",
  "subscription",
  "renewed",
  "Barber Studio"
]
{
  fileinto "Shopping/Invoices";
  stop;
}

###############################################################################
# Shopping – Tickets (travel bookings: flights, hotels, buses, trains)
###############################################################################

if anyof (

  /* Travel booking / trip confirmation patterns */
  header :contains "subject" [
    "booking confirmation",
    "reservation confirmed",
    "reservation confirmation",
    "your booking is confirmed",
    "your reservation is confirmed",
    "trip confirmation",
    "your trip is confirmed",
    "your trip confirmation",
    "travel itinerary",
    "itinerary / receipt",
    "flight itinerary",
    "your itinerary",
    "e-ticket",
    "e ticket",
    "eticket",
    "boarding pass",
    "your boarding pass",
    "check-in is now open",
    "check in is now open",
    "check-in open",
    "check in open",
    "bus ticket",
    "train ticket",
    "plane ticket",
    "билет",
    "билети",
    "резервация",
    "резервацията ви"
  ],

  /* Travel brands / platforms in From */
  header :contains "from" [
    "ryanair",
    "wizz air",
    "wizzair",
    "easyjet",
    "lufthansa",
    "air france",
    "klm",
    "qatar airways",
    "qatarairways",
    "emirates",
    "flydubai",
    "turkish airlines",
    "turkishairlines",
    "airbnb",
    "booking.com",
    "booking",
    "hotels.com",
    "hostelworld",
    "flixbus",
    "flix bus",
    "trainline",
    "bahn",
    "deutsche bahn",
    "sncf",
    "omio",
    "obilet",
	  "union ivkoni"
  ]
)
{
  fileinto "Shopping/Tickets";
  stop;
}


###############################################################################
# Shopping – Tracking / Shipping notifications
###############################################################################

elsif anyof (

  # Common shipping / tracking subject patterns
  header :contains "subject" [
    "your order has shipped",
    "order has shipped",
    "order shipped",
    "order is on its way",
    "your order is on its way",
    "your package is on the way",
    "is on the way",
    "shipment notification",
    "shipping confirmation",
    "dispatch confirmation",
    "your order dispatched",
    "tracking information",
    "tracking info",
    "tracking number",
    "track your package",
    "track your parcel",
    "track your order",
    "delivery update",
    "delivery information",
    "out for delivery",
    "has been delivered",
    "your order has been delivered",
	  "delivered",
	  "dispatched",
	  "on the way",
	  "package",
	  "проследяване",
	  "пратка",
	  "еконт",
	  "пратки"
  ],

  # Courier / carrier names in From
  header :contains "from" [
    "speedy",
    "econt",
    "boxnow",
    "ggbg",
    "dhl",
    "ups",
    "fedex",
    "tnt",
    "dpd",
    "hermes",
    "evri",
    "gls",
    "usps",
    "royal mail",
    "postnl",
    "post nl",
    "dpdgroup"
  ],

  # Courier / carrier names in Subject
  header :contains "subject" [
    "Speedy",
    "Econt",
    "BOX NOW",
    "GGBG",
    "DHL",
    "UPS",
    "FedEx",
    "TNT",
    "DPD",
    "Hermes",
    "Evri",
    "GLS",
    "USPS",
    "Royal Mail",
    "PostNL",
    "DPDgroup"
  ]
)
{
  fileinto "Shopping/Tracking";
  stop;
}

###############################################################################
# Shopping – Reselling platforms (StockX, Vinted, etc.)
###############################################################################

elsif anyof (
  header :contains "from" [
    "stockx",
    "vinted",
	  "vendora",
    "vestiaire collective",
    "vestiairecollective",
    "grailed",
    "depop",
    "goat",
    "wallapop",
    "kleiderkreisel",
	"olx"
  ],
  header :contains "subject" [
    "StockX",
    "Vinted",
	  "Vendora",
    "Vestiaire Collective",
    "Grailed",
    "Depop",
    "GOAT",
    "Wallapop",
    "Kleiderkreisel",
	"OLX"
  ],
  address :domain :is "from" [
    "stockx.com",
    "vinted.com",
	  "vendora.bg",
    "vestiairecollective.com",
    "grailed.com",
    "depop.com",
    "goat.com",
	  "olx.bg"
  ]
)
{
  fileinto "Shopping/Reselling";
  stop;
}
