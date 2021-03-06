----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2020 06:29:33 PM
-- Design Name: 
-- Module Name: CONST - Behavioral
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

entity CONST is
    Port (R: in STD_LOGIC_VECTOR(15 downto 0);
          SelC: in STD_LOGIC;
          Y: out STD_LOGIC_VECTOR(31 downto 0));
end CONST;


architecture Behavioral of CONST is

signal Y_aux: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

begin
proc: process(SelC, R)
        begin
            if (SelC = '0') then
                Y_aux(31 downto 16) <= (others => '0');
            else
                if ( R(15) = '0')then
                    Y_aux(31 downto 16) <= (others => '0');
                else
                    Y_aux(31 downto 16) <= (others => '1');
                end if;
            end if;
            Y_aux(15 downto 0) <= R;
     end process;
     
Y <= Y_aux;

end Behavioral;
