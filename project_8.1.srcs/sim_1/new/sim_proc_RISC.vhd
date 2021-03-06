----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/13/2020 07:45:37 PM
-- Design Name: 
-- Module Name: simulare - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simulare is
--  Port ( );
end simulare;

architecture Behavioral of simulare is

    constant CLK_PERIOD : TIME := 20 ns;   
    signal Clk      : std_logic;
    signal Rst      : STD_LOGIC;
    signal AdrInstr : STD_LOGIC_VECTOR (31 downto 0);
    signal Instr    : STD_LOGIC_VECTOR (31 downto 0);
    signal Data     : STD_LOGIC_VECTOR (31 downto 0);
    signal RA       : STD_LOGIC_VECTOR (31 downto 0);
    signal RB       : STD_LOGIC_VECTOR (31 downto 0);
    signal F        : STD_LOGIC_VECTOR (31 downto 0);
    signal ZF       : STD_LOGIC;
    signal CF       : STD_LOGIC;
    
begin

    gen_clk: process
        begin
             Clk <= '0';
             wait for (CLK_PERIOD/2);
             Clk <= '1';
             wait for (CLK_PERIOD/2);
    end process gen_clk;
        
DUT: entity work.proc_RISC
        generic map (DIM_MI => 256, 
                     DIM_MD => 256) 
        port map( Clk => Clk,
                  Rst => Rst,
                  AdrInstr => AdrInstr,
                  Instr => Instr,
                  Data => Data,
                  RA => RA,
                  RB => RB,
                  F  => F,
                  ZF => ZF,
                  CF => CF);
     
    gen_test: process
    begin     
        Rst <= '1';
        wait for 20ns;
        Rst <= '0';
        wait for 20ns;
        wait;
    end process; 

end Behavioral;
