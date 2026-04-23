require ["include", "environment", "variables", "relational",
         "comparator-i;ascii-numeric", "spamtest", "fileinto"];

# Generated: Do not run this script on spam messages
if allof (environment :matches "vnd.proton.spam-threshold" "*",
          spamtest :value "ge" :comparator "i;ascii-numeric" "${1}")
{
    return;
}

###############################################################################
# Admin – 2FA / Security Codes (generic, sender-agnostic)
###############################################################################

if anyof (

  /* Classic 2FA / OTP phrasing */
  header :contains "subject" [
    "verification code",
    "your verification code",
    "security code",
    "your security code",
    "login code",
    "your login code",
    "sign-in code",
    "sign in code",
    "authentication code",
    "auth code",
    "access code",
    "one-time password",
    "one time password",
    "one-time passcode",
    "one time passcode",
    "otp code",
    "otp:",
    "2fa code",
    "two-factor authentication",
    "two factor authentication",
    "2-step verification",
    "two-step verification",
    "multi-factor authentication",
    "mfa code",
    "please verify your device",
	  "Passcode:"
  ],

  /* Login / sign-in verification flows */
  header :contains "subject" [
    "verify your login",
    "verify your sign-in",
    "verify your sign in",
    "confirm your login",
    "confirm your sign-in",
    "confirm your sign in",
    "new sign-in",
    "new login",
    "login attempt",
    "sign-in attempt",
    "sign in attempt",
    "was this you logging in",
    "was this you signing in"
  ],

  /* Magic link / login link flows often used as passwordless 2FA/MFA */
  header :contains "subject" [
    "your login link",
    "your sign-in link",
    "sign in link",
    "login link",
    "magic link",
    "sign in to your account",
    "sign in to [",
    "sign in to "
  ]
)
{
  fileinto "Admin/2FA";
  stop;
}
