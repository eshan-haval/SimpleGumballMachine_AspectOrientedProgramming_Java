
public aspect anychange {
	pointcut callInsertCoin():
		execution(void GumballMachine.insertCoin(int));
	after(GumballMachine gm): callInsertCoin() && this(gm) {
		System.out.println("Inside insert coin joint point");
		if ( gm.getCoinValue() < 50 ) {
			int cv = gm.getCoinValue();
			//getting inserted coin value 
			Object[] args = thisJoinPoint.getArgs();
			int val = ((Integer)args[0]).intValue();
			gm.setCoinValue(cv+val);
        }
        else {
            System.out.println( "Already enough coins in the slot" ) ;
        }                  
	}
	
	pointcut callTurnTheCrank():
		execution(void GumballMachine.turnTheCrank());
	after(GumballMachine gm): callTurnTheCrank() && this(gm) {
		 if ( gm.getCoinValue() == 50 ) {
	            gm.setCoinValue(0);
	            if ( gm.getCount() > 0 ) {
	                System.out.println( "Here is your Gumball from tenant 3!  Enjoy!" ) ;
	                int c = gm.getCount();
	                //cnt-- ;
	                gm.setCount(c);
	            }
	            else {
	                System.out.println( "Sorry!  We're out of Gumballs!" ) ;
	            }
	        }
	        else {
	            System.out.println( "Sorry! You cannot turn the crank without enough Coins!" ) ;
	        }                 
      
	}
}