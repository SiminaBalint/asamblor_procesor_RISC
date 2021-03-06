----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/12/2020 06:26:57 PM
-- Design Name: 
-- Module Name: DCDI - Behavioral
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

entity DCDI is
    Port (CodE: in STD_LOGIC_VECTOR(31 downto 0);
          RegWr: out STD_LOGIC;
          AdrD: out STD_LOGIC_VECTOR(3 downto 0);
          MxD: out STD_LOGIC_VECTOR(1 downto 0);
          SSalt: out STD_LOGIC_VECTOR(1 downto 0);
          CSalt: out STD_LOGIC;
          MemWr: out STD_LOGIC;
          OpUAL: out STD_LOGIC_VECTOR(3 downto 0);
          MxA: out STD_LOGIC;
          MxB: out STD_LOGIC;
          AdrSA: out STD_LOGIC_VECTOR(3 downto 0);
          AdrSB: out STD_LOGIC_VECTOR(3 downto 0);
          SelC: out STD_LOGIC);
end DCDI;

architecture Behavioral of DCDI is

begin

AdrD <= CodE(23 downto 20);
AdrSA <= CodE(19 downto 16);
AdrSB <= CodE(15 downto 12);
OpUAL <= CodE(27 downto 24);

proc: process(CodE)
    begin
        case CodE(31 downto 24) is
            when x"00" =>   --NOP
                        RegWr <= '0';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0';
             when x"40" =>   --MOVA
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0'; 
             when x"02" =>   --ADD
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <='0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0'; 
             when x"05" =>    --SUB
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0';
              when x"08" =>   --AND
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0';  
               when x"09" =>   --OR
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0'; 
               when x"0A" =>   --XOR
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0'; 
                when x"0B" =>   --NOT
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0'; 
                when x"0D" =>   --SHR
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0';
                when x"0E" =>   --SHL
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0';
                when x"22" =>   --ADDI
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '1';
                        SelC <= '1';
                when x"25" =>   --SUBI
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '1';
                        SelC <= '1';
                when x"28" =>   --ANDI
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '1';
                        SelC <= '0';
                when x"29" =>   --ORI
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '1';
                        SelC <= '0';
                when x"2A" =>   --XORI
                        RegWr <= '1';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '1';
                        SelC <= '0';
               when x"60" =>   --BZ
                        RegWr <= '0';
                        MxD <= "00";
                        SSalt <= "01";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '1';
                        SelC <= '1';
               when x"50" =>   --BNZ
                        RegWr <= '0';
                        MxD <= "00";
                        SSalt <= "01";
                        CSalt <= '1';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '1';
                        SelC <= '1';
               when x"69" =>   --HALT
                        RegWr <= '0';
                        MxD <= "00";
                        SSalt <= "11";
                        CSalt <= '1';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0'; 
                when others =>  
                        RegWr <= '0';
                        MxD <= "00";
                        SSalt <= "00";
                        CSalt <= '0';
                        MemWr <= '0';
                        MxA <= '0';
                        MxB <= '0';
                        SelC <= '0';                                                             
        end case;
     end process;
end Behavioral;
