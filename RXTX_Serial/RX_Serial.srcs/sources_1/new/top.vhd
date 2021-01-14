----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.12.2020 21:21:36
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port (       send_character : in STD_LOGIC;
                 clk : in std_logic; 
                 serial_in : in std_logic;
                 serial_out: out std_logic;  
                -- data_strobe : out std_logic;
                 seg : out std_logic_vector(6 downto 0);
                 an  : out std_logic_vector(3 downto 0);
                 rst: in std_logic;
                 luz: out std_logic;
                 botoi: in STD_LOGIC;
                 luz2: out STD_LOGIC;
                 imp: out STD_LOGIC_VECTOR (5 downto 0));
end top;

architecture Behavioral of top is

component FrekuentziaZatitzailea is
    Port ( clk : in STD_LOGIC;
           en_16_x_baud : out STD_LOGIC);
end component;

component kcuart_rx is--recibe
    Port (  serial_in : in std_logic;  
            data_out : out std_logic_vector(7 downto 0);
            data_strobe : out std_logic;
            en_16_x_baud : in std_logic;
            clk : in std_logic);
end component;

component kcuart_tx is --manda
    Port (        data_in : in std_logic_vector(7 downto 0);
           send_character : in std_logic;
             en_16_x_baud : in std_logic;
               serial_out : out std_logic;
              Tx_complete : out std_logic;
                      clk : in std_logic);
    end component;
    
component EM is
    Port ( clk: in STD_LOGIC;
           data_strobe : in STD_LOGIC;
           clk16: in STD_LOGIC;
           rst: in STD_LOGIC;
           luz2: out STD_LOGIC;
           botoi: in STD_LOGIC;
           luz : out STD_LOGIC;
           send_character: out STD_LOGIC;
         --  datua: out STD_LOGIC_VECTOR (7 downto 0);
           datain: in STD_LOGIC_VECTOR (7 downto 0);
           o_uno: out STD_LOGIC_VECTOR (7 downto 0);
           o_dos: out STD_LOGIC_VECTOR (7 downto 0);
           o_tres: out STD_LOGIC_VECTOR (7 downto 0);
           o_cuatro: out STD_LOGIC_VECTOR (7 downto 0));
end component;
component para_mandar is
    Port (  clk: in STD_LOGIC;
           botoi: in STD_LOGIC;
          datua_out: out STD_LOGIC_VECTOR (7 downto 0);
          o_uno: in STD_LOGIC_VECTOR (7 downto 0);
          o_dos: in STD_LOGIC_VECTOR (7 downto 0);
          o_tres: in STD_LOGIC_VECTOR (7 downto 0);
          o_cuatro: in STD_LOGIC_VECTOR (7 downto 0)
          );
end component;
component display7 is
    Port ( signal_in : in STD_LOGIC_VECTOR (7 downto 0);
           an_in : in STD_LOGIC_VECTOR (3 downto 0);
           an_out : out STD_LOGIC_VECTOR (3 downto 0);
           seg_out : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal data: STD_LOGIC_VECTOR (7 downto 0);
signal clk_16_x: STD_LOGIC;
signal anodo_test: STD_LOGIC_VECTOR (3 downto 0) := "1111";
signal cosas: STD_LOGIC;
signal cosas2: STD_LOGIC;
signal dataChar: std_logic_vector(7 downto 0) := "01000111";
signal mandar:STD_LOGIC;
signal datafuera:std_logic_vector(7 downto 0);

signal s_uno,s_dos,s_tres,s_cuatro: STD_LOGIC_VECTOR (7 downto 0);

begin

imp <= "ZZZZZZ";

U1: FrekuentziaZatitzailea port map(
            clk=>clk,
            en_16_x_baud=>clk_16_x);
            
U2: kcuart_rx port map(
            serial_in=>serial_in,
            data_out=>data,
            data_strobe=>cosas,
            en_16_x_baud=>clk_16_x,
            clk=>clk);

--U3: display7 port map(
--           signal_in=>data,
--           an_in=>anodo_test,
--           an_out=>an,
--           seg_out=>seg);
           
U4: EM port map(
           clk=>clk,
           clk16=>clk_16_x,
           data_strobe=>cosas,
           rst=>rst,
           luz=>luz,
           botoi=>botoi,
           luz2=>luz2,
           send_character=>mandar,
           --datua=>datafuera,
           datain=>data,
          o_uno=>s_uno,
          o_dos=>s_dos,
          o_tres=>s_tres,
          o_cuatro=>s_cuatro
           );
           
U5: kcuart_tx port map(
            data_in =>datafuera,
            send_character => mandar,
            en_16_x_baud =>clk_16_x,
            serial_out =>serial_out,
            Tx_complete =>cosas2,
            clk =>clk);
U6: para_mandar port map(
           clk=>clk,
           botoi=>botoi,
          datua_out=>datafuera,
          o_uno=>s_uno,
          o_dos=>s_dos,
          o_tres=>s_tres,
          o_cuatro=>s_cuatro


);
end Behavioral;
