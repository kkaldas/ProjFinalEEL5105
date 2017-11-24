library IEEE;
use IEEE.std_logic_1164.all;

entity DeslocadorGeral is 
port(
         Ptos: in std_logic_vector(3 downto 0);
         sinal: in std_logic_vector(1 downto 0); --Nv
         H: in std_logic;
		 saida: out std_logic_vector(7 downto 0)
		 
        );
end DeslocadorGeral;

architecture DGArch of DeslocadorGeral is 
begin

saida <= "0000" & Ptos when sinal = "00" and (H = '1')  else
		"000" & Ptos & "0" when sinal = "01" and (H = '1') else
		"00" & Ptos & "00" when sinal = "10" and (H = '1') else
		"0" & Ptos & "000" when sinal = "11" and (H = '1') else
		"00000000";
	
end DGArch;


