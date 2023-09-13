//dart interface
//dartUpdateEvent();

const webNew3 = new Web3(window.ethereum);
contract = new webNew3.eth.Contract(contractABI, contractAddress);

async function walletConnect(){
    const accounts = await ethereum.enable();
	if (accounts.length > 0) {
    const userAccount = accounts[0];
    myAddress = accounts[0];
    dartUpdateAdresse(myAddress);
    startEventListener();
    var scBalance = await webNew3.eth.getBalance(contract._address);
    dartSetPot(parseInt(scBalance));
    }  
}

function payTicket(){
    contract.methods.buyTicket().send({ from: myAddress,gas: 200000, value: webNew3.utils.toWei('0.001', 'ether') })
    .on('transactionHash', function(hash) {
      //alert('Transaction hash:', hash);
    })
    .on('receipt', function(receipt) {
      //alert('Transaction receipt:', receipt);
      loadingScreen.style.display = "none";
    })
    .on('error', function(error) {
      alert('Transaction error:', error);
      loadingScreen.style.display = "none";
    });
}

function payout(){
    
}

function startEventListener(){
    var event = contract.events.UpdateWinner(function(error, result) {
        if (!error){
            console.log("UpdateWinner");
            console.log(result.returnValues.winner);
            console.log(result.returnValues.balance);
            dartWinnerUpdate(result.returnValues.winner,parseInt(result.returnValues.balance));
            dartSetPot(0);
        }
     });
     var event = contract.events.UpdateBalance(function(error, result) {
        if (!error){
            console.log("UpdateBalance");
            console.log(result.returnValues.balance);
            dartSetPot(parseInt(result.returnValues.balance));
        }
     });
}
