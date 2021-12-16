curl -u "$SAUCE_USERNAME:$SAUCE_ACCESS_KEY" --location \
--request POST 'https://api.us-west-1.saucelabs.com/v1/storage/upload' \
--form 'payload=@"../build/ExampleSwift.ipa"' \
--form 'name="ExampleSwift.ipa"'