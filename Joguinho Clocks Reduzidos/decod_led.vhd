library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity decod_led is
port
(
	pontos: in std_logic_vector(3 downto 0);
	leds: out std_logic_vector(9 downto 0);
	enable: in std_logic
);
end decod_led;

architecture struct of decod_led is
begin

leds <= 	"0000000000" when enable = '0' else
			"0000000000" when pontos = "0000" else
			"0000000001" when pontos = "0001" else
			"0000000011" when pontos = "0010" else
			"0000000111" when pontos = "0011" else
			"0000001111" when pontos = "0100" else
			"0000011111" when pontos = "0101" else
			"0000111111" when pontos = "0110" else
			"0001111111" when pontos = "0111" else
			"0011111111" when pontos = "1000" else
			"0111111111" when pontos = "1001" else
			"1111111111";
		
end struct;
			