
cd lib 
cp credentials.env.example.dart credentials.env.dart

# The syntax of -i is one difference between GNU sed and sed from mac os
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s/<GH_CLIENT_ID>/$GH_CLIENT_ID/" ./credentials.env.dart
else
  sed -i "s/<GH_CLIENT_ID>/$GH_CLIENT_ID/" ./credentials.env.dart
fi


# The syntax of -i is one difference between GNU sed and sed from mac os
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s/<GH_CLIENT_SECRET>/$GH_CLIENT_SECRET/" ./credentials.env.dart
else
  sed -i "s/<GH_CLIENT_SECRET>/$GH_CLIENT_SECRET/" ./credentials.env.dart
fi
