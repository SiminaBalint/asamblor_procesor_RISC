----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2020 06:30:23 PM
-- Design Name: 
-- Module Name: SELMUXC - Behavioral
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

entity SELMUXC is
    Port (SSalt: in STD_LOGIC_VECTOR(1 downto 0);
          CSalt: in STD_LOGIC;
          Z: in STD_LOGIC;
          MxC: out STD_LOGIC_VECTOR(1 downto 0));
end SELMUXC;

architecture Behavioral of SELMUXC is

begin

proc: process(SSalt, CSalt, Z)
begin
    case SSalt is
        when "00" => MxC <= "00";
        when "01" => if (CSalt = '0') then
                        if Z = '0' then
                            MxC <= "00";
                        else
                            MxC <= "01"; 
                        end if;
                     else
                        if Z = '0' then
                            MxC <= "01";
                        else
                            MxC <= "00";
                        end if;
                     end if;
        when "10" => MxC <= "10";
        when "11" => if (CSalt = '0') then
                        MxC <= "01";
                     else
                        MxC <= "11";
                     end if;
        when others => MxC <= "00";
    end case;
end process;

end Behavioral;
