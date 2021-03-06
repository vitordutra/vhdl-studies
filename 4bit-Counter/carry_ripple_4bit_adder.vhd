-- Curso de VHDL #17
-- Carry Ripple 4 bit adder em VHDL
-- Autor: João Vitor D. P. Gois
-- Data: 26/11/2020

library ieee;
use ieee.std_logic_1164.all;

entity carry_ripple_4bit_adder is
  port (
    -- Entradas
    A, B      : in std_logic_vector(3 downto 0); -- Vetor que vai de A(3) até A(0)
    CARRY_IN  : in std_logic;

    -- Saídas
    S         : out std_logic_vector(3 downto 0);
    CARRY_OUT : out std_logic
  );
end entity;

architecture main of carry_ripple_4bit_adder is

  -- Declaração do componente full_adder
  component full_adder is
    port (
      A, B     : in std_logic;
      CARRY_IN : in std_logic;
      SUM      : out std_logic;
      CARRY    : out std_logic
    );
  end component;

  -- Sinais Internos
  signal C1, C2, C3 : std_logic;

begin

  -- Instanciações Posicionais
  FA1: full_adder port map (A(0), B(0), CARRY_IN, S(0), C1);
  FA2: full_adder port map (A(1), B(1), C1,       S(1), C2);
  FA3: full_adder port map (A(2), B(2), C2,       S(2), C3);
  FA4: full_adder port map (A(3), B(3), C3,       S(3), CARRY_OUT);

end architecture;
