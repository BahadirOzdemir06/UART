library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UART_tx_tb is
generic (
c_clkfreq		: integer := 50_000_000 ;
c_baudrate		: integer := 115_200;
c_stopbit		: integer :=1
);
end UART_tx_tb;

architecture Behavioral of UART_tx_tb is

    
    component UART_tx
        generic (
            c_clkfreq  : integer := 50_000_000;
            c_baudrate : integer := 115_200;
            c_stopbit  : integer := 1
        );
        port (
            clk             : in  std_logic;
            rst_n           : in  std_logic;
            din_i           : in  std_logic_vector(7 downto 0);
            tx_start_i      : in  std_logic;
            tx_o            : out std_logic;
            tx_done_tick_o  : out std_logic
        );
    end component;

   
    signal clk_tb           : std_logic := '0';
    signal rst_n_tb         : std_logic := '0';
    signal din_i_tb         : std_logic_vector(7 downto 0) := (others => '0');
    signal tx_start_i_tb    : std_logic := '0';
    signal tx_o_tb          : std_logic:='0';
    signal tx_done_tick_tb  : std_logic:= '0';
  
    constant clk_period : time := 20 ns;  

begin

   
    dut: UART_tx
        generic map (
            c_clkfreq  => c_clkfreq,
            c_baudrate => c_baudrate,
            c_stopbit  => c_stopbit
        )
        port map (
            clk            => clk_tb,
            rst_n          => rst_n_tb,
            din_i          => din_i_tb,
            tx_start_i     => tx_start_i_tb,
            tx_o           => tx_o_tb,
            tx_done_tick_o => tx_done_tick_tb
        );

    
    clk_process : process
    begin
       
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
       
    end process;

    
    stim_proc: process
    begin
        
        rst_n_tb <= '0';
        din_i_tb <= "00000000";
        tx_start_i_tb <= '0';
        wait for 100 ns;
        rst_n_tb <= '1';
        wait for 100 ns;

        -----------------------
        din_i_tb <= "10101100";
        tx_start_i_tb <= '1';
        wait for clk_period;
        tx_start_i_tb <= '0';
        ------------------------
        wait for 10us;
        rst_n_tb <= '0';
        wait for 100ns;
        rst_n_tb <= '1';
        wait for 100 ns;
        ------------------------
        din_i_tb <= "10101100";
        tx_start_i_tb <= '1';
        wait for clk_period;
        tx_start_i_tb <= '0';
        wait for 100us;
        din_i_tb <= "10101010";
        tx_start_i_tb <= '1';
        wait for clk_period;
        tx_start_i_tb <= '0';
        wait for 1000 us;


        wait;
    end process;

end Behavioral;
