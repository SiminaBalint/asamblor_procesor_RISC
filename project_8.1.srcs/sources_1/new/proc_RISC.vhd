----------------------------------------------------------------------------------
-- Company:         UTCN
-- Engineer: 
-- 
-- Create Date:     15:57:46 04/11/2015 
-- Design Name:     proc_RISC
-- Module Name:     proc_RISC - Behavioral 
-- Project Name:    proc_RISC
-- Target Devices: 
-- Tool versions:   Vivado 2016.4
-- Description:     Modul principal al procesorului RISC
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity proc_RISC is
    Generic (DIM_MI : INTEGER := 256;           -- dimensiunea memoriei de instructiuni (cuvinte)
             DIM_MD : INTEGER := 256);          -- dimensiunea memoriei de date (cuvinte)
    Port ( Clk      : in  STD_LOGIC;
           Rst      : in  STD_LOGIC;
           AdrInstr : out STD_LOGIC_VECTOR (31 downto 0);
           Instr    : out STD_LOGIC_VECTOR (31 downto 0);
           Data     : out STD_LOGIC_VECTOR (31 downto 0);
           RA       : out STD_LOGIC_VECTOR (31 downto 0);
           RB       : out STD_LOGIC_VECTOR (31 downto 0);
           F        : out STD_LOGIC_VECTOR (31 downto 0);
           ZF       : out STD_LOGIC;
           CF       : out STD_LOGIC);
end proc_RISC;

architecture Behavioral of proc_RISC is

-- Semnale pentru interconectarea modulelor
    signal sMUXA        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sMUXB        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sMUXC        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sMUXD        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sPC          : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal PCplus       : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sMI          : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sPCIF        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sPCID        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sPCEX        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sRCONST      : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sRDoutA      : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sRDoutB      : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal AdrSalt      : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sUAL         : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sMD          : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sFEX         : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sMDEX        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sCCEX        : STD_LOGIC_VECTOR (1  downto 0) := (others => '0');
    signal sSGTE        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal sSLT         : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal NxorV        : STD_LOGIC := '0';
    signal NxnorV       : STD_LOGIC := '0';
    signal V            : STD_LOGIC := '0';
    signal C            : STD_LOGIC := '0';
    signal N            : STD_LOGIC := '0';
    signal Z            : STD_LOGIC := '0';

-- Semnale de comanda
    signal RegWr        : STD_LOGIC := '0';
    signal MemWr        : STD_LOGIC := '0';
    signal OpUAL        : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal Sh           : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal MxA          : STD_LOGIC := '0';
    signal MxB          : STD_LOGIC := '0';
    signal MxC          : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    signal MxD          : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    signal AdrSA        : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal AdrSB        : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal AdrD         : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');

-- Semnale pentru eliminarea hazardului de control prin predictia salturilor
    signal sMI_hazard   : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    
    signal sRI	        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
    signal RIDin        : STD_LOGIC_VECTOR(21 downto 0) := (others => '0');
	signal RIDout       : STD_LOGIC_VECTOR(21 downto 0) := (others => '0');
    signal REXin        : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
	signal REXout       : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
	signal IMin         : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
	signal IMout        : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
	signal CCEXin       : STD_LOGIC_VECTOR (1  downto 0) := (others => '0');
	signal SelC         : STD_LOGIC := '0';
	signal SSalt        : STD_LOGIC_VECTOR (1  downto 0) := (others => '0');
	signal CSalt        : STD_LOGIC := '0';
	signal Shn          : STD_LOGIC_VECTOR (4  downto 0) := (others => '0');
	signal EnInstr      : STD_LOGIC := '0';
	signal Q            : STD_LOGIC := '1';
	signal RegWr1        : STD_LOGIC := '0';
	signal AdrD1         : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
	signal MxD1         : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
	signal i1            : STD_LOGIC := '0';
	signal i2            : STD_LOGIC := '0';
	signal i3            : STD_LOGIC := '0';
	signal i4            : STD_LOGIC := '0';
	signal b5          : STD_LOGIC_VECTOR (3  downto 0) := (others => '0');
	signal b6          : STD_LOGIC_VECTOR (1  downto 0) := (others => '0');
	signal b7            : STD_LOGIC := '0';
	signal b8          : STD_LOGIC_VECTOR (3  downto 0) := (others => '0');
	signal b9            : STD_LOGIC := '0';
	signal b10            : STD_LOGIC := '0';
	signal b11          : STD_LOGIC_VECTOR (4  downto 0) := (others => '0');
	signal SSalt1        : STD_LOGIC_VECTOR (1  downto 0) := (others => '0');
	signal CSalt1        : STD_LOGIC := '0';
    signal OpUAL1        : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal MemWr1         : STD_LOGIC := '0';
    signal MxA1          : STD_LOGIC := '0';
    signal MxB1         : STD_LOGIC := '0';
	
	
begin
    MI:         entity WORK.mem_instr   port map (Clk => Clk, Rst => Rst, Adr => sPC(7 downto 0), Data => sMI);
    R:          entity WORK.set_reg     port map (Clk => Clk, Rst => Rst, WE => RegWr, AdrA => AdrSA, AdrB => AdrSB,
                                                  AdrD => AdrD, Din => sMUXD, DoutA => sRDoutA, DoutB => sRDoutB);
    UAL:        entity WORK.unit_aritm  port map (X => sMUXA, Y => sMUXB, Sel => OpUAL, Sh => Sh, F => sUAL, V => V, C => C, N => N, Z => Z);
    MD:         entity WORK.mem_date    port map (Clk => Clk, Rst => Rst, WE => MemWr, Adr => sMUXA(7 downto 0), Din => sMUXB, Dout => sMD);

    INCPC:      PCplus <= sPC + 1;
    ADDPC:      AdrSalt <= sPCID + sMUXB;
    MUXA:       sMUXA <= sRDoutA when MxA = '0' else sPCID;
    MUXB:       sMUXB <= sRDoutB when MxB = '0' else sRCONST;
    MUXC:       with MxC select
                    sMUXC <= PCplus when "00", AdrSalt when "01", sMUXA when "10", sPCEX when others;
    MUXD:       with MxD select
                    sMUXD <= sFEX when "00", sMDEX when "01", sSGTE when "10", sSLT when others;
    PC:         entity WORK.FDN  port map (Clk => Clk, D => sMUXC, CE => '1', Rst => Rst, Q => sPC);
    PCIF: 		entity WORK.FDN  port map (Clk => Clk, D => sPC, CE => '1', Rst => Rst, Q => sPCIF);
	PCID:		entity WORK.FDN	 port map (Clk => Clk, D => sPCIF, CE => '1', Rst => Rst, Q => sPCID);
	PCEX:		entity WORK.FDN  port map (Clk => Clk, D => sPCID, CE => '1', Rst => Rst, Q => sPCEX);
	RI: 		entity WORK.FDN  port map(Clk => Clk, D => sMI_hazard, CE => '1', Rst => Rst, Q => sRI);		
	RID: 		entity WORK.FDN  generic map (n => 22) port map(Clk => Clk, D => RIDin, CE => '1', Rst => Rst, Q => RIDout);
	REXin <= RIDout(21 downto 15);
    REX:		entity WORK.FDN  generic map (n =>  7) port map (Clk => Clk, D => REXin, CE => '1', Rst => Rst, Q => REXout);
    RCONST:		entity WORK.FDN	 port map (Clk => Clk, D => IMout, CE => '1', Rst => Rst, Q => sRCONST);
    NxorV  <= N xor V;
    NxnorV <= not NxorV;
    CCEXin(1) <= NxnorV;
	CCEXin(0) <= NxorV;  
    CCEX:		entity WORK.FDN	generic map (n => 2) port map (Clk => Clk, D => CCEXin, CE => '1', Rst => Rst, Q => sCCEX);
    sSLT   <= x"0000_000" & b"000" & sCCEX(0);
    sSGTE  <= x"0000_000" & b"000" & sCCEX(1);
    FEX: 		entity WORK.FDN  port map(Clk => Clk, D => sUAL, CE => '1', Rst => Rst, Q => sFEX); 
    MDEX: 		entity WORK.FDN  port map(Clk => Clk, D => sMD, CE => '1', Rst => Rst, Q => sMDEX);	    
    IMin <= sRI(15 downto 0);
    Shn <= sRI(4 downto 0);
	CONST:		entity WORK.CONST port map (R => IMin, SelC => SelC, Y => IMout);
    SSalt <= RIDout(14 DOWNTO 13);
    CSalt <= RIDout(12);
    SELMUXC:    entity WORK.SELMUXC	 port map (SSalt => SSalt, CSalt =>  CSalt, Z => Z, MxC => MxC);
    DCDI:		entity WORK.DCDI port map (CodE=> sRI, RegWr => RegWr1, AdrD => AdrD1, MxD => MxD1, SSalt => SSalt1, CSalt => CSalt1, 
                                           MemWr =>MemWr1, OpUAL => OpUAL1, MxA => MxA1, MxB => MxB1, AdrSA => AdrSA, AdrSB => AdrSB, SelC => SelC);
    
    EnInstr <= not(MxC(1) or MxC(0));
    i1<=EnInstr and RegWr1;
    i2<=EnInstr and SSalt1(1);
    i3<=EnInstr and SSalt1(0);
    i4<=EnInstr and MemWr1;
    b5<=AdrD1;
    b6<=MxD1;
    b7<=CSalt1;
    b8<=OpUAL1;
    b9<=MxA1;
    b10<=MxB1;
    b11<=sRI(4 downto 0);
    RIDin <= i1 & b5 & b6 & i2 & i3 & b7 & i4 & b8 & b9 & b10 & b11;	
    
    proc: process(Clk)
   	begin
   		if rising_edge(Clk) then
   			if Rst = '1' then
   				Q <= '1';
   			else 
   				Q <= EnInstr;
   		end if;
   		end if;
   	end process;
   	
   	gen: for i in 0 to 31 generate
   		sMI_hazard(i) <= Q and EnInstr and sMI(i);
   	end generate gen;
   	
-- Conectarea semnalelor la porturile de iesire
    MemWr <= RIDout(11);
	OpUAL <= RIDout(10 downto 7);
	MxA <= RIDout(6);
	MxB <= RIDout(5);
	Sh <= RIDout(4 downto 0);
    RegWr <= REXout(6);
	AdrD <= REXout(5 downto 2);
	MxD <= REXout (1 downto 0);
	
    AdrInstr <= sPCIF;
    Instr    <= sMI_hazard;
    Data     <= sMD;
    RA       <= sMUXA;
    RB       <= sMUXB;
    F        <= sUAL;
    ZF       <= Z;
    CF       <= C;

end Behavioral;
