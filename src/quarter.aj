
public aspect quarter {
	pointcut callInsertQuarter():
		execution(void GumballMachine.insertQuarter());
	after(GumballMachine gm) : callInsertQuarter() && this(gm) {
		if ( !gm.isQuarterInSlot() ) {
			gm.setQuarterInSlot(true) ;
        }
        else {
            System.out.println( "There's already a quarter in the slot" ) ;
        }        
	}
	
	pointcut callTurnTheCrank() :
		execution(void GumballMachine.turnTheCrank());
	after(GumballMachine gm): callTurnTheCrank() && this(gm) {
		if ( gm.isQuarterInSlot() ) {
            gm.setQuarterInSlot(false);
            if ( gm.getCount() > 0 ) {
                System.out.println( "Here is your Gumball from tenant 1!  Enjoy!" ) ;
                int c = gm.getCount();
                gm.setCount(c--); 
            }
            else {
                System.out.println( "Sorry! No Gumballs!"+gm.getCount() ) ;
            }
        }
        else {
            System.out.println( "You cannot turn the crank without a Quarter!" ) ;
        }              
	}
}