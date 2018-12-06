 EasyResync
# completenatary script needed in case the wallet goes out sync often 
# in order to automate it 
# crontab -e
# and the add the following line
# * */7 * * * cd && cd bash resync.sh
# then save with the choosen editor the basic one is vi so :q + enter will save and close it

cd ~/crowdclassiccore && ./crowdclassic-cli stop
sleep 10
cd
cd ~/.crowdclassiccore
rm governance.dat
rm netfulfilled.dat
rm peers.dat
rm -r blocks
rm mncache.dat
rm -r chainstate
rm fee_estimates.dat
rm mnpayments.dat
rm banlist.dat
cd
cd ~/crowdclassiccore && ./crowdclassicd -daemon -reindex
sleep 5
echo
echo
echo "Wait until blocks stop changing"
echo "Then press Crl+C"
sleep 10
watch ./crowdclassic-cli getinfo
echo
echo
echo "Wait until IsSynced = true"
echo "Then press Crl+C"
sleep 10
watch ./crowdclassic-cli mnsync status
