----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2025 05:28:17 PM
-- Design Name: 
-- Module Name: dp32 - Behavioral
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

library dp32_lib;
use dp32_lib.dp32_pkg.all;

entity dp32 is

    generic(
        Tpd: Time := unit_delay
    );
    port(
        d_bus : inout bus_bit_32 bus;
        a_bus : out bit_32;
        read, write : out bit;
        fetch : out bit;
        ready : in bit;
        phi1, phi2 : in bit;
        reset : in bit
    );
--  port (
--  btnC : in bit;
--  btnU : in bit;
--  btnL, btnR : out bit
--  );
 

end dp32;

architecture Behavioral of dp32 is

    subtype reg_addr is natural range 0 to 255;
    type reg_array is array (reg_addr) of bit_32;
    
begin
    process
    procedure memory_read(addr : in bit_32;
                    fetch_cycle : in boolean;
                    result : out bit_32) is
    begin
        
        a_bus <= addr after Tpd;
        fetch <= bool_to_bit(fetch_cycle) after Tpd;

        wait until phi1 = '1';
        if reset = '1' then
            return;
        end if;

        -- T1 phase
        read <= '1' after Tpd;
        wait until phi1 = '1';
        if reset = '1' then
            return;
        end if;

        -- T2 phase
        loop
            wait until phi2 = '0';
            if reset = '1' then
                return;
            end if;

            if ready = '1' then
                result := d_bus;
                exit;
            end if;
        end loop;

        wait until phi1 = '1';
        if reset = '1' then
            return;
        end if;

        read <= '0' after Tpd;
    end procedure memory_read;

    begin
        if reset = '1' then
            read <= '0' after Tpd;
        end if;

    end process;
end Behavioral;
