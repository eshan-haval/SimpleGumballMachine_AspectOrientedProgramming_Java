public class GumballMachine {

	private int cnt = 0;
	private boolean quarterInSlot = false;
	private int coinValue = 0;

	public int getCoinValue() {
		return coinValue;
	}

	public void setCoinValue(int v) {
		this.coinValue = v;
	}

	public boolean isQuarterInSlot() {
		return quarterInSlot;
	}

	public void setQuarterInSlot(boolean q) {
		this.quarterInSlot = q;
	}

	public GumballMachine(int count) {
		this.cnt = count;
	}

	public void insertQuarter() {
	}

	public void insertCoin(int value) {
	}

	public void turnTheCrank() {
	}

	public int getCount() {
		return cnt;
	}

	public void setCount(int c) {
		cnt = c;
	}

	public static void main(String[] args) {
		GumballMachine m = new GumballMachine(2);
		System.out.println("*** Gumball Machine Tenant *** ");
		m.insertQuarter();
		m.turnTheCrank(); // should eject for tenant #1
		m.insertQuarter();
		m.turnTheCrank(); // should eject for tenant #1 and #2 (note: tenant #3 does not impl. insertQuarter()
		m.insertCoin(10);
		m.insertCoin(10);
		m.insertCoin(5);
		m.insertCoin(25);
		m.turnTheCrank(); // should eject for tenant #3
		m.insertCoin(10);
		m.insertCoin(10);
		m.turnTheCrank(); // should eject for tenant #3
	}

}