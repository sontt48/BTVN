import requests

url = "https://crcps-auth.omni.manh.com/oauth/token"

payload = 'grant_type=password&username=apiusertestcrcuat&password=2023!piusertestCRC'
headers = {
  'Content-Type': 'application/x-www-form-urlencoded',
  'Authorization': 'Basic b21uaWNvbXBvbmVudC4xLjAuMDpiNHM4cmdUeWc1NVhZTnVu'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)