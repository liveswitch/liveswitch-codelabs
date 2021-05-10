namespace HelloWorld {

    export class DataBytesConverter {
        /**
         * Convert a string into Uint8Array
         */
        public static toDataBytes(str: string): Uint8Array {
            return new TextEncoder().encode(str);
        }

        /**
         * Convert an int into Uint8Array
         */
        public static intToDataBytes(x: number): Uint8Array {
            return new Uint8Array([
                (x & 0xff000000) >> 24,
                (x & 0x00ff0000) >> 16,
                (x & 0x0000ff00) >> 8,
                (x & 0x000000ff)
            ]);
        }

        /**
         * Convert Uint8Array into int
         */
        public static toInt(dataBytes: Uint8Array): number {
            return new DataView(dataBytes.buffer).getUint32(0);
        }

        /**
         * Convert Uint8Array into string
         */
        public static toString(dataBytes: Uint8Array): string {
            return new TextDecoder().decode(dataBytes);
        }
    }

}