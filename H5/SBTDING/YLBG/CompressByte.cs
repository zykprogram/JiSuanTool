using ICSharpCode.SharpZipLib.Checksums;
using ICSharpCode.SharpZipLib.Zip;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace WebApp.H5.SBTDING.YLBG
{
    public static class CompressByte
    {
        /// <summary>
        /// 用压缩算法压缩一个字符串
        /// </summary>
        /// <param name="input">输入的字符串.</param>
        /// <returns>返回字节</returns>
        public static byte[] CompressString(string input)
        {
            return CompressBytes(Encoding.UTF8.GetBytes(input));
        }
        /// <summary>
        /// Decompress a byte stream of a string that was formerly 
        /// compressed with the CompressString() routine with the ZIP algorithm.
        /// </summary>
        /// <param name="input">The buffer that contains the compressed
        /// stream with the string.</param>
        /// <returns>Returns the decompressed string.</returns>
        public static string DecompressString(
            byte[] input)
        {
            return Encoding.UTF8.GetString(DecompressBytes(input));
        }

        /// <summary>
        /// 用压缩算法压缩字节
        /// </summary>
        /// <param name="input">需要压缩的字节</param>
        /// <returns>返回压缩的字节</returns>
        public static byte[] CompressBytes(byte[] input)
        {
            using (MemoryStream buf = new MemoryStream())
            using (ZipOutputStream zip = new ZipOutputStream(buf))
            {
                Crc32 crc = new Crc32();
                zip.SetLevel(9);    // 0..9.

                ZipEntry entry = new ZipEntry(string.Empty);
                entry.DateTime = DateTime.Now;
                entry.Size = input.Length;

                crc.Reset();
                crc.Update(input);

                entry.Crc = crc.Value;

                zip.PutNextEntry(entry);

                zip.Write(input, 0, input.Length);
                zip.Finish();

                // --

                byte[] c = new byte[buf.Length];
                buf.Seek(0, SeekOrigin.Begin);
                buf.Read(c, 0, c.Length);

                // --

                zip.Close();

                return c;
            }
        }

        /// <summary>
        /// Decompress a byte stream that was formerly compressed
        /// with the CompressBytes() routine with the ZIP algorithm.
        /// </summary>
        /// <param name="input">The buffer that contains the compressed
        /// stream with the bytes.</param>
        /// <returns>Returns the decompressed bytes.</returns>
        public static byte[] DecompressBytes(
            byte[] input)
        {
            using (MemoryStream mem = new MemoryStream(input))
            using (ZipInputStream stm = new ZipInputStream(mem))
            using (MemoryStream mem2 = new MemoryStream())
            {
                ZipEntry entry = stm.GetNextEntry();
                if (entry != null)
                {
                    byte[] data = new byte[4096];

                    while (true)
                    {
                        int size = stm.Read(data, 0, data.Length);
                        if (size > 0)
                        {
                            mem2.Write(data, 0, size);
                        }
                        else
                        {
                            break;
                        }
                    }
                }

                using (BinaryReader r = new BinaryReader(mem2))
                {
                    byte[] c = new byte[mem2.Length];
                    mem2.Seek(0, SeekOrigin.Begin);
                    r.Read(c, 0, (int)mem2.Length);

                    return c;
                }
            }
        }
    }
}