================================================================================
  OUTLOOK / HOTMAIL MULTI-MONITOR  (Graph Edition)
  Complete Beginner Guide (Step by Step)
================================================================================

IMPORTANT — Graph only:
  Every poll uses Microsoft Graph (Inbox + Junk). There is no IMAP polling.
  Poll All Now, Auto-poll, Check, and Re-proxy & Poll Errors all use Graph.
  Your refresh tokens need Graph Mail.Read permission or accounts will error.

This program is a private tool that runs ONLY on YOUR computer.
It lets you watch many Hotmail / Outlook email accounts at the same time,
see new messages (including Junk/Spam), and open full email bodies via Graph.

Nobody on the internet can open this tool. It only works on your own PC.


--------------------------------------------------------------------------------
PART 1 — WHAT YOU NEED BEFORE STARTING
--------------------------------------------------------------------------------

1. A Windows computer (or Windows Virtual Machine).

2. Python installed.
   - Go to: https://www.python.org/downloads/
   - Download the latest version.
   - During installation, put a CHECK MARK on:
        "Add python.exe to PATH"
   - Click Install.

3. Your account list. This build automatically accepts all SIX formats:

        email|password|client_id|refresh_token
        email|password|refresh_token|client_id
        email----password----client_id----refresh_token
        email----password----refresh_token----client_id
        email:password:client_id:refresh_token
        email:password:refresh_token:client_id

   The importer detects both the delimiter and the GUID/UUID-shaped client_id
   automatically. Supported formats can be mixed in the same import.

   - email          = the Hotmail/Outlook address
   - password       = the password (optional for reading mail, but useful to store)
   - refresh_token  = a special long code that lets the tool read mail without
                      logging in every time
   - client_id      = a special ID that was used when the token was created

4. (Optional but recommended for many accounts)
   A list of residential proxies in this format (one per line):

        host:port:username:password

   Example:
        192.168.1.10:8000:user1:pass1


--------------------------------------------------------------------------------
PART 2 — HOW TO START THE PROGRAM
--------------------------------------------------------------------------------

1. Open the folder that contains these files:
      - start.bat
      - app.py
      - README.txt
      - templates folder
      - etc.

2. Double-click the file named:   start.bat

3. A black window will open.
   - The first time it may say it is installing libraries (flask, requests).
   - Wait until you see a message like:
        Open →  http://127.0.0.1:5000

4. Open your web browser (Chrome, Edge, Firefox, etc.).

5. In the address bar type exactly:

        http://127.0.0.1:5000

   Then press Enter.

6. You should now see the dark-themed dashboard of the tool.

IMPORTANT:
- Keep the black window open the whole time.
- If you close the black window, the tool stops.


--------------------------------------------------------------------------------
PART 3 — FIRST-TIME SETUP (SETTINGS PAGE)
--------------------------------------------------------------------------------

Click the "Settings" button at the top right.

You will see three important things:

A) Max Simultaneous Accounts
   - This is how many accounts the tool checks at the SAME TIME.
   - Choices: 10, 20, 30, 40, 50, 60, 70, 80, 90, 100
   - Higher number = faster, but can cause more errors if your internet
     or proxies are weak.
   - Recommended for beginners: 15 or 20
   - Recommended if you have good residential proxies: 30–50

B) Auto-Poll Interval (minutes)
   - How often the tool automatically checks ALL accounts again
     when "Start Auto" is turned on.
   - Default is 30 minutes.
   - You can set it from 5 to 120 minutes.
   - Longer interval = safer (less chance Microsoft slows you down).

C) Residential Proxies box
   - Paste your proxy list here (one proxy per line).
   - Format: host:port:user:pass
   - The tool automatically gives each account a different proxy.
   - If one account fails, it can try another proxy.
   - If you leave this empty, the tool uses your normal internet connection.
   - Good proxies help a lot when you have hundreds of accounts.

After you finish, click "Save Settings".


--------------------------------------------------------------------------------
PART 4 — IMPORTING YOUR EMAIL ACCOUNTS
--------------------------------------------------------------------------------

1. Click the blue "Import" button at the top right.

2. You can either:
      - choose a .txt file with one account per line, OR
      - paste accounts into the text box.

   You may also use both in the same import. The importer processes large lists
   in batches and is designed to handle 20,000+ stored accounts.

3. Each line may use any supported layout:
        email|password|client_id|refresh_token
        email|password|refresh_token|client_id
        email----password----client_id----refresh_token
        email----password----refresh_token----client_id
        email:password:client_id:refresh_token
        email:password:refresh_token:client_id

   The app automatically detects the delimiter and the client_id field.
   You can mix these formats in one import.

4. Click "Import / Update Accounts".

5. The tool will add or update all valid accounts. Existing email addresses are
   updated in place instead of being duplicated.
   - It does NOT start checking them automatically.
   - You must click a button yourself to start polling.

6. Go back to the main Dashboard.
   You will see your accounts listed in the same order you pasted them.


--------------------------------------------------------------------------------
PART 5 — THE MAIN DASHBOARD (WHAT YOU SEE)
--------------------------------------------------------------------------------

At the top you see four big numbers:

  • Total Accounts   = how many accounts you imported
  • Healthy (OK)     = accounts that worked the last time they were checked
  • Errors           = accounts that failed the last time they were checked
  • Enabled          = accounts that are turned on for monitoring

These numbers can be refreshed by clicking "Refresh Status".


BUTTONS AT THE TOP:

  Poll All Now
      - Immediately starts checking EVERY enabled account one time.
      - Uses your proxies (if you added any).
      - Tries each account only once.
      - If an account fails or takes longer than 20 seconds → it goes to ERRORS.
      - Progress is shown at the top of the screen.

  Start Auto
      - Turns on automatic checking.
      - The tool will keep checking all accounts every X minutes
        (the number you set in Settings).

  Stop Auto
      - Turns off the automatic checking.

  Stop & Reset Poll
      - Immediately stops any poll that is running right now.
      - Returns the tool to "Idle / Ready".
      - Does NOT delete your accounts or proxies.

  Full Reset
      - WARNING: This deletes EVERYTHING.
      - All accounts, all saved emails, and all proxies are erased.
      - Settings go back to default.
      - Use this only when you want to start completely from zero.

  Export email:password
      - Downloads a simple text file containing:
            email:password
        for every account (in the original order).
      - Useful for backup or other tools.


--------------------------------------------------------------------------------
PART 6 — ALL ACCOUNTS LIST (LEFT SIDE)
--------------------------------------------------------------------------------

This is the full list of every account you imported, in the same order
you imported them. For large account collections, the dashboard shows the list
in pages instead of trying to render all accounts at once. You can choose
50, 100, 250, or 500 accounts per page and search by email or note.

For each account you see:

  • The email address
  • Small icons to COPY the email or the password (one click)
  • Status icon:
        green check  = OK (Healthy)
        red X        = Error
  • Two buttons:
        Check   = normal poll for this one account only
        Graph   = special poll that tries to use Microsoft Graph
                  (needed if you want to read the FULL body of emails)

CLICKING an account row opens that account’s inbox on the right side.


--------------------------------------------------------------------------------
PART 7 — NEW EMAILS BOX (RIGHT SIDE)
--------------------------------------------------------------------------------

This is the live feed of new messages from ALL accounts.

- Newest messages appear at the top.
- Messages from Inbox and from Junk/Spam are mixed together by date.
- Messages that came from Junk show a small [Junk] tag in the subject.
- Under each subject you see the RECEIVER email (which account got the mail)
  in blue, so it is easy to read.
- Below that you see who sent the message.

You can click "Mark all seen" to clear the "new" badges.


--------------------------------------------------------------------------------
PART 8 — OPENING ONE ACCOUNT’S INBOX
--------------------------------------------------------------------------------

Click any account in the left list.

The right side changes to that account’s inbox.

Buttons inside the inbox:

  Refresh
      - Fetches the latest messages for this account only
        (normal method).

  Graph Fetch
      - Forces the tool to use Microsoft Graph API for this account.
      - This is important if you want to open an email and read the
        COMPLETE full text (not just a short preview).
      - If you see an error like "401" or "Unauthorized", it means
        this account’s token does not have Graph permission.
        In that case you can still see the list of subjects, but
        full body may only show a short preview.

CLICKING a message in the list:
  - The tool tries to load the full email body.
  - You will see subject, sender, date, and the complete text.
  - Use the "Back to inbox" button to return to the list.


--------------------------------------------------------------------------------
PART 9 — WHAT IS “GRAPH FETCH”? (SIMPLE EXPLANATION)
--------------------------------------------------------------------------------

Microsoft gives two main ways to read mail:

1. IMAP
   - Older style.
   - Good for listing subjects and seeing that new mail arrived.
   - Often works with the tokens you already have.
   - Full body of the email is harder to get.

2. Graph (Microsoft Graph API)
   - Newer style.
   - Can easily download the complete email text (full body).
   - Needs a token that was given "Mail.Read" permission.

The "Graph" / "Graph Fetch" button tries to force the Graph method
for that one account so you can read full messages.

If the token was only created for IMAP, Graph will fail with a 401 error.
That is normal. The account can still be monitored for new subjects.


--------------------------------------------------------------------------------
PART 10 — THE ERRORS BOX (BOTTOM)
--------------------------------------------------------------------------------

This box is collapsible (click the header to open or close it).

It shows only the accounts that failed the last time they were checked.

For each error account you can:
  - Copy email / password
  - See the short error message
  - Click "Check" to try that account again

There is also a big button:

  Re-proxy & Poll Errors
      - Takes only the accounts that are currently in ERRORS.
      - Gives them new proxies (if you have a proxy list).
      - Polls them one more time.
      - Any account that succeeds moves out of ERRORS into Healthy.


--------------------------------------------------------------------------------
PART 11 — HOW POLLING WORKS (IMPORTANT RULES)
--------------------------------------------------------------------------------

When the tool checks accounts (Poll All Now, Auto, or Re-proxy & Poll Errors):

  • It can check many accounts at the same time (the number you set in Settings).
  • Each account gets one proxy (if proxies are loaded).
  • Each account is tried only ONCE.
  • If the check takes longer than 20 seconds → that account is marked ERROR.
  • If anything fails → the account goes to ERRORS immediately.
  • At the end, Healthy + Errors should equal Total Accounts.
    (No account is silently skipped.)

Polling does NOT start by itself after you import accounts.
You must click "Poll All Now" or "Start Auto".


--------------------------------------------------------------------------------
PART 12 — RECOMMENDED ORDER OF USE (FROM ZERO)
--------------------------------------------------------------------------------

1. Double-click start.bat and open http://127.0.0.1:5000

2. Go to Settings
   - Set Max Simultaneous Accounts (start with 15–20)
   - Set Auto-Poll Interval (30 is fine)
   - Paste your proxy list (if you have one)
   - Click Save Settings

3. Click Import
   - Paste your email|password|refresh_token|client_id list
   - Click Import / Update

4. On the Dashboard click "Poll All Now"
   - Watch the progress at the top
   - Wait until it finishes

5. Click "Refresh Status"
   - Look at Healthy vs Errors

6. Open the ERRORS box
   - Click "Re-proxy & Poll Errors" if you want to retry the failed ones

7. When you want continuous monitoring, click "Start Auto"

8. To read a full email:
   - Click the account on the left
   - Click "Graph Fetch" (optional but better for full body)
   - Click the message you want to read


--------------------------------------------------------------------------------
PART 13 — TIPS FOR 100–500 ACCOUNTS
--------------------------------------------------------------------------------

• Always test with 5–10 accounts first.
• Use good quality residential proxies.
• Start with Max Simultaneous = 15 or 20.
• Increase slowly only if most accounts stay Healthy.
• Keep Auto-Poll Interval at 20–30 minutes or longer.
• Keep the black start.bat window open.
• Use "Stop & Reset Poll" if a poll seems stuck.
• Use "Export email:password" to keep a backup of credentials.


--------------------------------------------------------------------------------
PART 14 — SECURITY WARNINGS (READ CAREFULLY)
--------------------------------------------------------------------------------

• All your tokens and passwords are stored in a local file called monitor.db
  inside the same folder.

• Only run this tool on a computer you personally trust.

• Never upload this folder to the internet or put it on a shared drive.

• The web page is only available on your own computer (127.0.0.1).
  Other people on the internet cannot open it.

• When you are finished, you can close the black window to stop the tool.


--------------------------------------------------------------------------------
PART 15 — COMMON PROBLEMS AND SOLUTIONS
--------------------------------------------------------------------------------

Problem: "python is not recognized"
Solution: Re-install Python and make sure "Add python.exe to PATH" is checked.

Problem: Browser says "This site can’t be reached"
Solution: Make sure the black start.bat window is still open.
          Type exactly: http://127.0.0.1:5000

Problem: Many accounts go to ERRORS with token errors
Solution: The refresh_token is expired or invalid.
          You need fresh tokens from the original tool that created them.

Problem: Graph Fetch shows 401 Unauthorized
Solution: That token does not have Microsoft Graph permission.
          You can still use normal Check to see subjects and new mail.
          Full body may only show a short preview.

Problem: Poll gets stuck near the end
Solution: Click "Stop & Reset Poll", then try again.
          The tool has a 20-second timeout so it should not hang forever.

Problem: No new emails appear even after polling
Solution: Click Refresh Status.
          Open a single account and click Refresh or Graph Fetch.
          Make sure the account status is OK (green).


--------------------------------------------------------------------------------
PART 16 — QUICK MEANING OF IMPORTANT WORDS
--------------------------------------------------------------------------------

Poll / Polling
    = The tool asking Microsoft “Are there any new emails?” for the accounts.

Healthy
    = The account worked the last time it was checked.

Errors
    = The account failed the last time it was checked.

Proxy
    = A middle computer that hides your real internet address.
      Useful when checking many accounts so Microsoft does not block you.

Refresh Token
    = A long secret code that lets the tool read mail without typing
      the password every time.

Graph
    = Microsoft’s modern way to read the full content of emails.

IMAP
    = An older way to list emails. Good for subjects, weaker for full body.

Auto-Poll
    = The tool automatically checks all accounts every X minutes
      without you clicking anything.


================================================================================
You now have a complete local dashboard for monitoring many
Outlook / Hotmail accounts on your own computer.

If something is unclear, read the matching part above again slowly.
================================================================================


--------------------------------------------------------------------------------
NEW-LIST COMPATIBILITY IN THIS BUILD
--------------------------------------------------------------------------------

This rebuilt version fixes imports where the list uses:

    email|password|client_id|refresh_token

Older builds interpreted fields 3 and 4 only as refresh_token|client_id, which
caused token exchange failures for the new layout. This build detects the GUID
client ID automatically and also repairs previously saved rows whose OAuth fields
were accidentally swapped.

For safety, malformed or ambiguous rows are skipped and reported by line number
instead of being silently saved with the wrong field order.
