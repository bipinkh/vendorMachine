LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE behavior OF tb IS 
  
signal CLK,RSTn,Soda : std_logic := '0';
signal CoinIn,CoinOut : std_logic_vector (1 downto 0):= "00";
signal states : std_logic_vector (2 downto 0):= "000";
constant Clk_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
   uut: entity work.FSM PORT MAP (
        CLK => CLK,
		  RSTn => RSTn,
		  CoinIn => CoinIn,
		  Soda => Soda,
		  CoinOut => CoinOut,
		  states => states
        );

   -- Clock process definitions
   Clk_process :process
   begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
   end process;
    
   -- Stimulus process(applying inputs 'i' and 'j').
   stim_proc: process
   begin       
    wait for Clk_period*2;
    RSTn <= '1'; wait for 6 ns;
	 RSTn <= '0'; wait for Clk_period*2;
	 
	 --insert 2 rupees
	 wait for Clk_period*5;
    CoinIn <= "10"; wait for Clk_period*1;
	 CoinIn <= "00";wait for Clk_period*1;
	 
	 --insert 5 rupees
	 wait for Clk_period*10;
    CoinIn <= "11"; wait for Clk_period*1;
	 CoinIn <= "00";wait for Clk_period*1;
	 
	 --insert 1 and 2 rupees
	 wait for Clk_period*5;
    CoinIn <= "01"; wait for Clk_period*1;
	 CoinIn <= "00";wait for Clk_period*2;
    CoinIn <= "10"; wait for Clk_period*1;
	 CoinIn <= "00";wait for Clk_period*1;
	 
	 --insert 1 and 1 rupees
	 wait for Clk_period*5;
    CoinIn <= "01"; wait for Clk_period*1;
	 CoinIn <= "00";wait for Clk_period*2;
    CoinIn <= "01"; wait for Clk_period*1;
	 CoinIn <= "00";wait for Clk_period*1;	
	 
	 --insert 1 and 5 rupees
	 wait for Clk_period*5;
    CoinIn <= "01"; wait for Clk_period*1;
	 CoinIn <= "00";wait for Clk_period*2;
    CoinIn <= "11"; wait for Clk_period*1;
	 CoinIn <= "00";wait for Clk_period*1;	 
	 
	 
    wait;
   end process;

END;
