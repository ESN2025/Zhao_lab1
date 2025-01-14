LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity light is
port(
            reset_reset_n          : in  std_logic ;
            clk_clk                : in  std_logic  ;                             
            button1_export    : in  std_logic ;                                
            led8_export    : out std_logic_vector(7 downto 0);                                            
            sw2_export     : in  std_logic_vector(1 downto 0)  );  
end entity light;


architecture rtl of light is

	 	component unsaved is
		port (
			clk_clk        : in  std_logic                    := 'X';             -- clk
			reset_reset_n  : in  std_logic                    := 'X';             -- reset_n
			led8_export    : out std_logic_vector(7 downto 0);                    -- export
			button1_export : in  std_logic                    := 'X';             -- export
			sw2_export     : in  std_logic_vector(1 downto 0) := (others => 'X')  -- export
		);
	end component unsaved;

begin
    
    	u0 : component unsaved
		port map (
			clk_clk        => clk_clk,        --     clk.clk
			reset_reset_n  => reset_reset_n,  --   reset.reset_n
			led8_export    => led8_export,    --    led8.export
			button1_export => button1_export, -- button1.export
			sw2_export     => sw2_export      --     sw2.export
		);

    
 END ARCHITECTURE rtl;