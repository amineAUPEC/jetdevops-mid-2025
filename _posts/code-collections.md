## code collections
- [date-generator.sh](http://date-generator.sh) as $i-month-year
    - code : [date-generator.sh](http://date-generator.sh) as $i-month-year
        
        ```markdown
        #!/bin/bash
        year="$1"
        year="2024"
        
        month_shorter=("Jan" "Feb" "March" "Apr" "May" "June" "Jul" "Aug" "Sept" "Oct" "Nov" "Dec")
        month=("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")
        len=${#month[*]}
        for (( j=1; j<=len; j++ ));
        do
            echo "$j-${month[$j-1]}-${year}"
        done
        ```
        
    - output : [date-generator.sh](http://date-generator.sh) as $i-month-year
        
        ```markdown
        $ ./date-generator.sh
        0-January-2024
        1-February-2024
        2-March-2024
        3-April-2024
        4-May-2024
        5-June-2024
        6-July-2024
        7-August-2024
        8-September-2024
        9-October-2024
        10-November-2024
        11-December-2024
        
        ```
        
    - output : [date-generator.sh](http://date-generator.sh) as $i-month-year shorter
        
        ```markdown
        $ ./date-generator.sh
        0-Jan-2024
        1-Feb-2024
        2-March-2024
        3-Apr-2024
        4-May-2024
        5-June-2024
        6-Jul-2024
        7-Aug-2024
        8-Sept-2024
        9-Oct-2024
        10-Nov-2024
        11-Dec-2024
        
        ```
        

- cards array
    
    ```jsx
    var cards=$$('a');
    console.log(cards);
    var cards_length=cards.length;
    var cards_array=[];
    var cards_href=[];
    
    // for each card in  cards
    for(var i=0;i<cards_length;i++){
        cards_array+=cards[i].innerText+"\n";
        cards_href+=cards[i].href+"\n";
    }
    
    console.log(cards_array);
    console.table(cards_array);
    function download(filename, text) {
        var element = document.createElement('a');
        element.setAttribute('href', 'data:text/plain;charset=utf-8,%EF%BB%BF' + encodeURIComponent(text));
        element.setAttribute('download', filename);  
        element.style.display = 'none';
        document.body.appendChild(element);
        element.click();
        document.body.removeChild(element);
    }
    
    download('cards_array.csv',cards_array);
    download('cards_href.csv',cards_href);
    ```
    

- scapping outlook email account & categorize emails in a spreadsheet
    
    ```python
    !pip install pywin32 pandas 
    
    import win32com.client
    import pandas as pd
    # Initialize Outlook
    outlook = win32com.client.Dispatch("Outlook.Application")
    namespace = outlook.GetNamespace("MAPI")
    
    # Access the inbox (or any other folder)
    inbox = namespace.GetDefaultFolder(6) # 6 refers to the inbox folder
    messages = inbox.Items
    
    # Prepare a list to hold email data
    email_data = []
    
    # Loop through messages and collect data
    for message in messages:
        try:
            email_info = {
            "Subject": message.Subject,
            "Sender": message.SenderName
            #"Received Time": message.ReceivedTime,
            #"Body": message.Body,
            }
            email_data.append(email_info)
        except Exception as e:
            print(f"Error processing email: {e}")
    
    # Create a DataFrame and export to Excel
    df = pd.DataFrame(email_data)
    df.to_excel("outlook_emails.xlsx", index=False)
    
    ```
    
    ```python
     !pip install imaplib2 pandas openpyxl 
     
     
     
    import imaplib
    import email
    import pandas as pd
    # Connect to the Outlook IMAP server
    username = 'your_email@outlook.com'
    password = 'your_password'
    mail = imaplib.IMAP4_SSL('outlook.office365.com')
    
    # Login
    mail.login(username, password)
    
    # Select the mailbox you want to scrape (e.g., INBOX)
    mail.select("inbox")
    
    # Search for all emails
    status, messages = mail.search(None, 'ALL')
    email_ids = messages[0].split()
    
    # Prepare a list to hold email data
    email_data = []
    
    # Loop through emails and collect data
    for email_id in email_ids:
    status, msg_data = mail.fetch(email_id, '(RFC822)')
    msg = email.message_from_bytes(msg_data[0][1])
    email_info = {
    "Subject": msg['subject'],
    "Sender": msg['from'],
    "Received Time": msg['date'],
    "Body": msg.get_payload(decode=True).decode()
    }
    email_data.append(email_info)
    
    # Create a DataFrame and export to Excel
    df = pd.DataFrame(email_data)
    df.to_excel("outlook_emails.xlsx", index=False)
    
    # Logout
    mail.logout()
    ```
