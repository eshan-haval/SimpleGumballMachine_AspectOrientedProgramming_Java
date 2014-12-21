
public aspect doublequarter {
	pointcut callInsertQuarter():
		execution(void GumballMachine.insertQuarter());
	after(GumballMachine gm): callInsertQuarter() && this(gm) {
		 if ( gm.getCoinValue() < 50 ) {
	          //  coinValue += 25 ;
			 int cv = gm.getCoinValue();
			 gm.setCoinValue(cv+25);
	        }
	        else {
	            System.out.println( "There are already quarters in the slot" ) ;
	        }             
	}
	
	pointcut callTurnTheCrank():
		execution(void GumballMachine.turnTheCrank());
	after(GumballMachine gm): callTurnTheCrank() && this(gm) {
		 if ( gm.getCoinValue() == 50 ) {
	            gm.setCoinValue(0);
	            if ( gm.getCount() > 0 ) {
	                System.out.println( "Here is your Gumball from tenant 2!  Enjoy!" ) ;
	                //cnt-- ;
	                int c = gm.getCount();
	                gm.setCount(c--);
	            }
	            else {
	                System.out.println( "Sorry!  No Gumballs!" ) ;
	            }
	        }
	        else {
	            System.out.println( "You cannot turn the crank without Quarters!" ) ;
	        }              
      
	}
	}