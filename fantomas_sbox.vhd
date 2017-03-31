library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity fantomas_sbox is
	port (
		a : in std_logic_vector(7 downto 0);
		o : out std_logic_vector(7 downto 0)
	);
end entity fantomas_sbox;

architecture behav of fantomas_sbox is
  -----------------------------------------------------------------------------
  -- Type definitions
  -----------------------------------------------------------------------------
  subtype ByteInt is integer range 0 to 255;
  type ByteArray is array (0 to 255) of ByteInt;
  -----------------------------------------------------------------------------
  -- Constants
  -----------------------------------------------------------------------------
  constant SBOX : ByteArray := (
  30, 117, 95, 225, 153, 252, 137, 47, 134, 238, 241, 123, 35, 82, 16, 148, 12,
  183, 77, 103, 216, 66, 200, 214, 196, 107, 170, 186, 61, 165, 0, 51, 83, 45,
  11, 184, 218, 168, 197, 108, 202, 182, 164, 34, 96, 7, 93, 215, 79, 244, 21,
  50, 129, 27, 156, 142, 145, 63, 230, 249, 112, 233, 67, 126, 141, 243, 204,
  101, 8, 122, 24, 171, 22, 106, 119, 253, 167, 192, 130, 4, 159, 49, 222, 227,
  73, 208, 89, 70, 84, 239, 46, 60, 187, 33, 146, 181, 85, 62, 15, 169, 220,
  185, 193, 127, 206, 166, 180, 48, 114, 3, 91, 209, 75, 228, 19, 32, 133, 29,
  154, 138, 151, 44, 246, 232, 98, 248, 71, 109, 41, 65, 104, 213, 172, 203,
  190, 26, 176, 219, 199, 78, 23, 100, 38, 160, 57, 131, 120, 81, 237, 118, 255,
  226, 242, 92, 157, 143, 10, 147, 52, 5, 37, 88, 124, 205, 175, 223, 179, 25,
  189, 194, 210, 86, 20, 113, 42, 163, 58, 128, 97, 68, 245, 110, 235, 251, 231,
  72, 144, 140, 6, 158, 55, 9, 152, 229, 217, 115, 31, 111, 13, 188, 2, 125, 99,
  234, 177, 212, 150, 18, 136, 39, 201, 247, 94, 198, 76, 80, 64, 250, 59, 43,
  174, 53, 132, 161, 1, 105, 90, 254, 139, 236, 149, 40, 155, 240, 224, 102, 36,
  87, 14, 135, 28, 178, 69, 116, 211, 74, 207, 221, 195, 121, 162, 191, 54, 173,
  17, 56);
begin
	o <= std_logic_vector(to_unsigned(SBOX(to_integer(unsigned(a))), 8));
end architecture behav;
