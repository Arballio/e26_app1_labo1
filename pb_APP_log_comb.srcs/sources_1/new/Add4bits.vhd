----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2026 12:50:41 PM
-- Design Name: 
-- Module Name: Add4bits - Behavioral
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

entity Add4bits is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);
end Add4bits;

architecture Behavioral of Add4bits is

component Add1bitA is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC);
end component;

component Add1bitB is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           S : out STD_LOGIC);
end component;

signal TempC : std_logic_vector (2 downto 0);
--signal TempCout : std_logic_vector (2 downto 0);


begin

    Add1 : Add1bitA 
        port map (X => X(0), Y => Y(0), Cin => Cin, S => S(0), Cout => TempC(0));
    
    Add2 : Add1bitB
        port map (X => X(1), Y => Y(1), Cin => TempC(0), S => S(1), Cout => TempC(1));
    
    Add3 : Add1bitA 
        port map (X => X(2), Y => Y(2), Cin => TempC(1), S => S(2), Cout => TempC(2));
    
    Add4 : Add1bitB 
        port map (X => X(3), Y => Y(3), Cin => TempC(2), S => S(3), Cout => Cout);
    



end Behavioral;
