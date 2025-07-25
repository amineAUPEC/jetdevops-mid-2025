code yt python api
```python
import google_auth_oauthlib.flow
import googleapiclient.discovery
import googleapiclient.errors

# Replace with your YouTube Data API credentials
client_id = "YOUR_CLIENT_ID"
client_secret = "YOUR_CLIENT_SECRET"
redirect_uri = "YOUR_REDIRECT_URI"

# Set up the OAuth2 flow
flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file(
    "client_secret.json",
    scopes=["https://www.googleapis.com/auth/youtube.readonly"]
)
flow.redirect_uri = redirect_uri

# Authorize the user
authorization_url = flow.authorization_url()
print("Go to this URL to authorize the application:")
print(authorization_url)

# Get the user's consent and exchange the authorization code for tokens
code = input("Enter the authorization code: ")
flow.fetch_token(code=code)

# Create a YouTube API client
youtube = googleapiclient.discovery.build("youtube", "v3", credentials=flow.credentials)

# Get the playlist ID from the user
playlist_id = input("Enter the playlist ID: ")

# Retrieve playlist items
playlist_items_request = youtube.playlistItems().list(
    part="snippet",
    playlistId=playlist_id,
    maxResults=50
)

# Handle pagination
while True:
    playlist_items_response = playlist_items_request.execute()
    playlist_items = playlist_items_response.get("items", [])

    for item in playlist_items:
        snippet = item.get("snippet")
        video_title = snippet.get("title")
        video_url = f"https://www.youtube.com/watch?v={item['snippet']['resourceId']['videoId']}"
        channel_name = snippet.get("channelTitle")
        channel_id = snippet.get("channelId")

        print(f"Video URL: {video_url}")
        print(f"Title: {video_title}")
        print(f"Channel Name: {channel_name}")
        print(f"Channel ID: {channel_id}")
        print()

    next_page_token = playlist_items_response.get("nextPageToken")
    if not next_page_token:
        break

    playlist_items_request = youtube.playlistItems().list(
        part="snippet",
        playlistId=playlist_id,
        maxResults=50,
        pageToken=next_page_token
    )
```