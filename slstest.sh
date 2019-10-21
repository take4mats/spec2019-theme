BASEURL=https://x0eqiwmit9.execute-api.us-west-2.amazonaws.com/dev
# BASEURL=https://l12wa1q1z3.execute-api.us-west-2.amazonaws.com/dev

USERA=`uuid`
USERB=`uuid`
echo "USER A: $USERA\n"
curl -XPOST -d "{\"id\":\"$USERA\",\"name\":\"$USERA\"}" $BASEURL/users
echo

echo "USER B: $USERB"
curl -XPOST -d "{\"id\":\"$USERB\",\"name\":\"$USERB\"}" $BASEURL/users
echo

TA1=`uuid`
curl -XPOST -d "{\"userId\":\"$USERA\",\"chargeAmount\":100,\"transactionId\":\"$TA1\",\"locationId\":\"1\"}" $BASEURL/wallet/charge
echo

TA2=`uuid`
curl -XPOST -d "{\"userId\":\"$USERA\",\"useAmount\":40,\"transactionId\":\"$TA2\",\"locationId\":\"1\"}" $BASEURL/wallet/use
echo

TB1=`uuid`
curl -XPOST -d "{\"userId\":\"$USERB\",\"chargeAmount\":200,\"transactionId\":\"$TB1\",\"locationId\":\"1\"}" $BASEURL/wallet/charge
echo

TB2=`uuid`
curl -XPOST -d "{\"userId\":\"$USERB\",\"useAmount\":120,\"transactionId\":\"$TB2\",\"locationId\":\"1\"}" $BASEURL/wallet/use
echo

TB3=`uuid`
curl -XPOST -d "{\"fromUserId\":\"$USERB\",\"toUserId\":\"$USERA\",\"transferAmount\":20,\"transactionId\":\"$TB3\",\"locationId\":\"1\"}" $BASEURL/wallet/transfer
echo

echo curl $BASEURL/users/$USERA/history
curl $BASEURL/users/$USERA/history | jq .
echo

echo curl $BASEURL/users/$USERB/history
curl $BASEURL/users/$USERB/history | jq .
echo

echo curl $BASEURL/users/$USERA/summary
curl $BASEURL/users/$USERA/summary 
echo

echo curl $BASEURL/users/$USERB/summary
curl $BASEURL/users/$USERB/summary 
echo


