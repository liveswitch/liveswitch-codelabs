using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloWorld
{
    static class DataBytesConverter
    {
        /**
         * Convert a string into byte[]
         */
        public static byte[] ToDataBytes(string str)
        {
            return Encoding.ASCII.GetBytes(str);
        }

        /**
         * Convert an int into byte[] (big endian)
         */
        public static byte[] ToDataBytes(int x)
        {
            var bytes = BitConverter.GetBytes(x);
            if (BitConverter.IsLittleEndian)
            {
                Array.Reverse(bytes);
            }
            return bytes;
        }

        /**
         * Convert a byte[] (big endian) into int
         */
        public static int ToInt(byte[] dataBytes, int offset)
        {
            var x = BitConverter.ToInt32(dataBytes, offset);
            if (BitConverter.IsLittleEndian)
            {
                dataBytes = BitConverter.GetBytes(x);
                Array.Reverse(dataBytes);
                x = BitConverter.ToInt32(dataBytes, 0);
            }
            return x;
        }

        /**
         * Convert a byte[] into string
         */
        public static string ToString(byte[] dataBytes, int offset, int length)
        {
            return Encoding.Default.GetString(dataBytes, offset, length);
        }
    }
}
