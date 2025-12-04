----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 04:22:46 PM
-- Design Name: 
-- Module Name: dp32_pkg - Behavioral
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

package dp32_pkg is

    constant unit_delay : Time := 1 ns;
    
    type bool_to_bit_table is array (boolean) of bit;
    constant bool_to_bit : bool_to_bit_table;
    
    subtype bit_32 is bit_vector(31 downto 0);
    type bit_32_array is array (integer range <>) of bit_32;
    function resolve_bit_32 (driver: in bit_32_array) return bit_32;
    subtype bus_bit_32 is resolve_bit_32 bit_32;
    
    subtype bit_8 is bit_vector(7 downto 0);
    
    subtype CC_bits is bit_vector(2 downto 0);
    subtype cm_bits is bit_vector(3 downto 0);
    
    constant op_add: bit_8 := X"00";
    constant op_sub: bit_8 := X"01";
    constant op_mul: bit_8 := X"02";
    constant op_div: bit_8 := X"03";
    constant op_addq: bit_8 := X"10";
    constant op_subq: bit_8 := X"11";
    constant op_mulq: bit_8 := X"12";
    constant op_divq: bit_8 := X"13";
    constant op_land: bit_8 := X"04";
    constant op_lor: bit_8 := X"05";
    constant op_lxor: bit_8 := X"06";
    constant op_lmask: bit_8 := X"07";
    constant op_ld: bit_8 := X"20";
    constant op_st: bit_8 := X"21";
    constant op_ldq: bit_8 := X"30";
    constant op_stq: bit_8 := X"31";
    constant op_br: bit_8 := X"40";
    constant op_brq: bit_8 := X"50";
    constant op_bi: bit_8 := X"41";
    constant op_biq: bit_8 := X"51";

    function bits_to_int(bits : in bit_vector) return integer;

end dp32_pkg;

package body dp32_pkg is 

    constant bool_to_bit : bool_to_bit_table := (false => '0', true => '1');

    function resolve_bit_32(driver : in bit_32_array) return bit_32 is
        constant float_value : bit_32 := X"0000_0000";
        variable result: bit_32 := float_value;

    begin
        for i in driver'range loop
            result := result or driver(i);
        end loop;
        return result;
    end resolve_bit_32;

    function bits_to_int(bits: in bit_vector) return integer is
        variable temp: bit_vector(bits'range);
        variable result : integer := 0;
    begin
        if bits(bits'left) = '1' then
            temp := not bits;
        else
            temp := bits;
        end if;

        for index in bits'range loop
            result := result * 2 + bit'pos(temp(index)); 
        end loop;
        
        if bits(bits'left) = '1' then
            result := (-result) - 1;
        end if;
        return result;
    end bits_to_int;


    
    -- function bits_to_int (bits : in bit_vector) return integer is
    --     variable temp : bit_vector(bits'range);
    --     variable result : integer := 0;
    --     begin
    --     if bits(bits'left) = '1' then-- negative number
    --     temp := not bits;
    --     else
    --     temp := bits;
    --     end if;
    --     for index in bits'range loop-- sign bit of temp = '0'
    --     result := result * 2 + bit'pos(temp(index));
    --     end loop;
    --     if bits(bits'left) = '1' then
    --     result := (-result) - 1;
    --     end if;
    -- return result;
    -- send bits_to_int;
end dp32_pkg;
