public class SecretBankAccount {
    Integer accountNumber;
    String accountName = '';
    Decimal amount;

    public SecretBankAccount(Integer accNumber, String accName, Decimal accAmount) {
        this.accountNumber = accNumber;
        this.accountName = accName;
        this.amount = accAmount;
    }

    public void createAccount() {
        // Integer accNum, String accName, Decimal amount
        // this.accountNumber = accNum;
        // this.accountName = accName;
        // this.amount = amount;
        System.debug('Account successfully created: ' + accountNumber + ' ' + accountName + ' ' + amount);
    }

    public void depositAmount(Decimal input) {
        Decimal currentBalance = amount + input;
        amount = currentBalance;
        System.debug('Amount Deposited Succesfully!');
        System.debug('Amount Deposited: ' + input);
        System.debug('Current Balance: ' + currentBalance);
    }

    public void withdrawAmount(Decimal input) {
        if (!(input > amount)) {
            Decimal currentBalance = amount - input;
            amount = currentBalance;
            System.debug('Amount Withdrawn Successfully!');
            System.debug('Amount Withdrawn: ' + input);
            // System.debug('Current Balance: ' + currentBalance);
        } else {
            System.debug('ERROR: Sorry, Sufficient Balance not Available!');
        }
        System.debug('Current Balance: ' + amount);
    }

    public void seeAccountDetails() {
        System.debug('Account Number: ' + accountNumber);
        System.debug('Account Name: ' + accountName);
        System.debug('Available Balance: ' + amount);
    }
}