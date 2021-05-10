var HelloWorld;
(function (HelloWorld) {
    var DataBytesConverter = /** @class */ (function () {
        function DataBytesConverter() {
        }
        /**
         * Convert a string into Uint8Array
         */
        DataBytesConverter.toDataBytes = function (str) {
            return new TextEncoder().encode(str);
        };
        /**
         * Convert an int into Uint8Array
         */
        DataBytesConverter.intToDataBytes = function (x) {
            return new Uint8Array([
                (x & 0xff000000) >> 24,
                (x & 0x00ff0000) >> 16,
                (x & 0x0000ff00) >> 8,
                (x & 0x000000ff)
            ]);
        };
        /**
         * Convert Uint8Array into int
         */
        DataBytesConverter.toInt = function (dataBytes) {
            return new DataView(dataBytes.buffer).getUint32(0);
        };
        /**
         * Convert Uint8Array into string
         */
        DataBytesConverter.toString = function (dataBytes) {
            return new TextDecoder().decode(dataBytes);
        };
        return DataBytesConverter;
    }());
    HelloWorld.DataBytesConverter = DataBytesConverter;
})(HelloWorld || (HelloWorld = {}));
