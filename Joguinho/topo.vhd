library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity topo is
	port
	(
		CLOCK_50: in std_logic;
		KEY: in std_logic_vector(5 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(6 downto 0);
		SW: in std_logic_vector(9 downto 0);
		LEDR: out std_logic_vector(9 downto 0)
	);
end topo;

architecture bhv of topo is
signal final: std_logic;
signal BTN0, BTN1, BTN2, BTN3, E0, E1, E2, E3, E4, R0, R1, R2, R3, R4, Ec, Rc, Eh1, Eh2, Eh3, El: std_logic;


	component ButtonSync is
		port
		(
			KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
			BTN0, BTN1, BTN2, BTN3: out std_logic
		);
	end component;
	
	component datapath is
		port
		(
			E0, E1, E2, E3, E4, R0, R1, R2, R3, R4, Ec, Rc, Eh1, Eh2, Eh3, El, CLOCK_50: in std_logic;
			
			LEDR: out std_logic_vector(9 downto 0);
			
			SW: in std_logic_vector(9 downto 0);
			
			HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(6 downto 0);
			
			acabou: out std_logic
		);
	end component;
	
	component controle is
		port
		(
			clock, acabou, BTN0, BTN1: in std_logic;
			E0, E1, E2, E3, E4, R0, R1, R2, R3, R4, Ec, Rc, Eh1, Eh2, Eh3, El: out std_logic
		);
	end component;
	
	begin
	
		sync: ButtonSync port map(KEY(0), KEY(1), KEY(2), KEY(3), CLOCK_50, BTN0, BTN1, BTN2, BTN3);
		C: controle port map(CLOCK_50, final, BTN0, BTN1, E0, E1, E2, E3, E4, R0, R1, R2, R3, R4, Ec, Rc, Eh1, Eh2, Eh3, El);
		D: datapath port map(E0, E1, E2, E3, E4, R0, R1, R2, R3, R4, Ec, Rc, Eh1, Eh2, Eh3, El, CLOCK_50, LEDR, SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, final);
		
end bhv;