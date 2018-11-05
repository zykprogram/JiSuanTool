using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;


namespace WebApp.yx
{
    /// <summary>
    ///上传文件操作类 
    /// </summary>
    public class UploadFiles
    {
        private string _vPath = string.Empty;
        private FileUpload _fup = null;
        private Label _labPrompt = null;
        private string _path = string.Empty;
        private string _fileExtension = string.Empty;
        private string _newFileName = string.Empty;
        private string _tempFileName = string.Empty;
        private bool _isAllowExtension = false;
        private string _filePath = string.Empty;
        private string[] _allowedExtensions = { ".gif", ".jpg", ".png", ".jpeg", ".bmp", ".swf", ".flv", ".rar", ".zip", ".doc", ".ppt", ".txt", ".xls" };
        private HttpPostedFile _hpf = null; //客户端控件形式上传定义 作者：付辉平 修改时间：2009-04-28

        private Stream KHsr = null;
        private string _diaph = ""; //水印透明度
        private string _waterpos = "4";
        private int _width;
        private int _height;
        /// <summary>
        /// 水印位置
        /// </summary>
        public string Waterpos
        {
            get { return _waterpos; }
            set { _waterpos = value; }
        }
        /// <summary>
        /// 水印图片宽度
        /// </summary>
        public int width
        {
            get { return _width; }
            set { _width = value; }
        }

        /// <summary>
        /// 水印图片高度
        /// </summary>
        public int height
        {
            get { return _height; }
            set { _height = value; }
        }

        /// <summary>
        /// 保存上传的图片
        /// </summary>
        /// <param name="vPath">图片存放的目录,相对路径,要注意调用页面的当前路径,可以用~/开头以从根目录开始</param>
        /// <param name="fup">上传控件</param>
        /// <param name="labPrompt">上传提示完成的Lable控件,为null则不提示</param>
        public UploadFiles(string vPath, FileUpload fup, Label labPrompt, string FileName, Stream sr)
        {
            this.KHsr = sr;
            this._vPath = vPath;
            this._fup = fup;
            this._labPrompt = labPrompt;
            this._path = HttpContext.Current.Server.MapPath(vPath);
            this._isAllowExtension = IsAllowExtension();
            if (_isAllowExtension)
            {
                this._newFileName = FileName;
             //  this._filePath = DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString();
                this._filePath = vPath;
               
                this._tempFileName = this._filePath + "/" + this._newFileName;
            }
            else
            {
                if (_labPrompt != null)
                {
                    _labPrompt.Text += "此类的文件类型不允许上传的！";
                }
            }
        }

        /// <summary>
        /// 保存上传的图片
        /// </summary>
        /// <param name="vPath">图片存放的目录,相对路径,要注意调用页面的当前路径,可以用~/开头以从根目录开始</param>
        /// <param name="fup">上传控件</param>
        /// <param name="labPrompt">上传提示完成的Lable控件,为null则不提示</param>
        public UploadFiles(string vPath, HttpPostedFile hpf, Label labPrompt)
        {
            this._vPath = vPath;
            this._hpf = hpf;
            this._labPrompt = labPrompt;
            this._path = HttpContext.Current.Server.MapPath(vPath);
            this._isAllowExtension = IsAllowExtensionByClient();
            if (_isAllowExtension)
            {
                this._newFileName = GetDateRandom(5);
                this._filePath = DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString();
                this._tempFileName = this._filePath + "/" + this._newFileName + this._fileExtension;
            }
            else
            {
                if (_labPrompt != null)
                {
                    _labPrompt.Text += "此类的文件类型不允许上传的！";
                }
            }
        }

        /// <summary>
        /// 上传图片
        /// </summary>
        /// <returns></returns>
        public string SavePic()
        {
            if (_isAllowExtension)
            {
                BuildFolder(_path + "/" + _filePath);
                string tempPath = _path + "/" + _tempFileName;
                _fup.PostedFile.SaveAs(tempPath);

                if (_labPrompt != null)
                {
                    _labPrompt.Text += "文件上传成功！";
                }
            }
            return _tempFileName;
        }

        /// <summary>
        /// 上传各种类型的文件  不管是否上传都会返回年月日+5位随机数，只是没有扩展名 一般别用 要用也是判断是否有扩展名
        /// </summary>
        /// <returns></returns>
        public string SaveFile()
        {
            if (_fup.FileName != "")
            {
                this._fileExtension = Path.GetExtension(_fup.FileName).ToLower();
                this._newFileName = GetDateRandom(5);
                this._filePath = DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString();
                this._tempFileName = this._filePath + "/" + this._newFileName + this._fileExtension;

                BuildFolder(_path + "/" + _filePath);
                string tempPath = _path + "/" + _tempFileName;
                _fup.PostedFile.SaveAs(tempPath);

                if (_labPrompt != null)
                {
                    _labPrompt.Text += "文件上传成功！";
                }
            }
            return _tempFileName;
        }

        /// <summary>
        /// 客户端控件上传图片
        /// 时间：2009-04-28
        /// 作者：付辉平
        /// </summary>
        /// <returns></returns>
        public string SavePicByClient()
        {
            if (_isAllowExtension)
            {
                BuildFolder(_path + "/" + _filePath);
                string tempPath = _path + "/" + _tempFileName;
                _hpf.SaveAs(tempPath);
                if (_labPrompt != null)
                {
                    _labPrompt.Text += "文件上传成功！";
                }
            }
            return _tempFileName;
        }

        /// <summary>
        /// 上传各种类型的文件
        /// </summary>
        /// <returns></returns>
        public string SaveFileByClient()
        {
            if (true)
            {
                this._fileExtension = Path.GetExtension(_hpf.FileName).ToLower();
                this._newFileName = GetDateRandom(5);
                this._filePath = DateTime.Now.Year.ToString() + "/" + DateTime.Now.Month.ToString();
                this._tempFileName = this._filePath + "/" + this._newFileName + this._fileExtension;

                BuildFolder(_path + "/" + _filePath);
                string tempPath = _path + "/" + _tempFileName;
                _hpf.SaveAs(tempPath);

                if (_labPrompt != null)
                {
                    _labPrompt.Text += "文件上传成功！";
                }
            }
            return _tempFileName;
        }

        /// <summary>
        /// 上传中等缩略图   图片后缀_S
        /// </summary>
        public string SaveThumbnailsPic(int width, int height)
        {
            string newName = string.Empty;
            if (_isAllowExtension)
            {
                string tempPath = _path + "/" + _tempFileName;
                if (!File.Exists(tempPath))
                {
                    tempPath = _path + "/" + _tempFileName;
                }
          
                Bitmap objPic = new Bitmap(KHsr);
           

                int x = objPic.Width;
                int y = objPic.Height;
                double rate = (float)y / (float)x;
                if (x < width)
                {
                    if (y > height)
                    {
                        width = (int)(height / rate);
                    }
                    else
                    {
                        width = x;
                        height = y;
                    }
                }
                else
                {
                    if (width <= 0 && height <= 0)
                    {
                        width = x;
                        height = y;
                    }
                    else if (x >= y)
                    {
                        //height = (int)(width * rate);

                        //改写为如果等比例压缩后高度仍然大于定义的高度，再次以高度为准压缩一次
                        int height1 = (int)(width * rate);
                        if (height1 <= height)
                        {
                            height = height1;
                        }
                        else
                        {
                            double rate1 = (float)width / (float)height1;
                            width = (int)(height * rate1);
                        }
                    }
                    else if (x < y)
                    {
                        //width = (int)(height / rate);

                        //改写为如果等比例压缩后宽度仍然大于定义的宽度，再次以宽度为准压缩一次
                        int width1 = (int)(height / rate);
                        if (width1 <= width)
                        {
                            width = width1;
                        }
                        else
                        {
                            double rate1 = (float)height / (float)width1;
                            height = (int)(width * rate1);
                        }
                    }
                }

                Bitmap objNewPic = new Bitmap(objPic, width, height);

              //  newName = _tempFileName.Replace(_fileExtension, "_S" + _fileExtension);
                string newPath = _path + "\\" + _newFileName;

                objNewPic.Save(newPath);
                //objNewPic.Save(newPath);
                objPic.Dispose();
                objNewPic.Dispose();
            }
            return newName;
        }

        /// <summary>
        /// 客户端控件上传缩略图 以_S后缀
        /// 作者：付辉平
        /// 时间：2009-04-28
        /// </summary>
        public string SaveThumbnailsPicByClient(int width, int height)
        {
            //height = 0;
            string newName = string.Empty;
            if (_isAllowExtension)
            {
                //if (width == 0) { width = 800; }
                //if (height == 0) { height = 700; }
                string tempPath = _path + "/" + _tempFileName;
                if (!File.Exists(tempPath))
                {
                    tempPath = _path + "/" + SavePicByClient();
                }

                Bitmap objPic = new Bitmap(tempPath);

                int x = objPic.Width;
                int y = objPic.Height;
                double rate= (float)y /(float) x;
                if (x < width)
                {
                    if (y > height)
                    {
                        width = (int)(height / rate);
                    }
                    else
                    {
                        width = x;
                        height = y;
                    }
                }
                else
                {
                    if (width <= 0 && height <= 0)
                    {
                        width = x;
                        height = y;
                    }
                    //else if (width > 0 && height <= 0)
                    else if (x >= y)
                    {
                        height = (int)(width * rate);
                    }
                    //else if (width <= 0 && height > 0)
                    else if (x < y)
                    {
                        width = (int)(height / rate);
                    }
                }

                Bitmap objNewPic = new Bitmap(objPic, width, height);

                newName = _tempFileName.Replace(_fileExtension, "_S" + _fileExtension);
                string newPath = _path + "/" + newName;
                try
                {
                    objNewPic.Save(newPath);
                }
                catch(Exception error)
                {
                   
                }
                objPic.Dispose();
                objNewPic.Dispose();
            }
            return newName;
        }

        /// <summary>
        /// 是否存符合上传文件的扩展名
        /// </summary>
        /// <returns></returns>
        private bool IsAllowExtension()
        {
            bool fileOk = false;
            if (IsHasFile())
            {
                _fileExtension = Path.GetExtension(_fup.FileName).ToLower();
                for (int i = 0; i < _allowedExtensions.Length; i++)
                {
                    if (_fileExtension == _allowedExtensions[i])
                    {
                        fileOk = true;
                        break;
                    }
                }
            }
            return fileOk;
        }

        /// <summary>
        /// 客户端控件形式判断是否存符合上传文件的扩展名
        /// 作者：付辉平 
        /// 2009-04-28
        /// </summary>
        /// <returns></returns>
        private bool IsAllowExtensionByClient()
        {
            bool fileOk = false;
            if (IsHasFileByClient())
            {
                _fileExtension = Path.GetExtension(System.IO.Path.GetFileName(_hpf.FileName)).ToLower();
                for (int i = 0; i < _allowedExtensions.Length; i++)
                {
                    if (_fileExtension == _allowedExtensions[i])
                    {
                        fileOk = true;
                        break;
                    }
                }
            }
            return fileOk;
        }

        /// <summary>
        /// 是否存在上传的文件
        /// </summary>
        /// <returns></returns>
        private bool IsHasFile()
        {
            if (_fup != null)
            {
                return _fup.HasFile;
            }
            return false;
        }

        /// <summary>
        /// 客户端形式判断是否存在上传的文件
        /// 作者：付辉平
        /// 时间：2009-04-28
        /// </summary>
        /// <returns></returns>
        private bool IsHasFileByClient()
        {
            string fileName = System.IO.Path.GetFileName(_hpf.FileName);
            if (fileName != "")
            {
                return true;
            }
            return false;
        }

        /// <summary>
        /// 建立文件夹
        /// </summary>
        /// <param name="path"></param>
        public void BuildFolder(string path)
        {
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
        }

        /// <summary>
        /// 判断文件是否存在
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        public static bool HasPic(string file)
        {
            if (File.Exists(file))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 取得日期加时间随机数
        /// </summary>
        /// <param name="int_Count"></param>
        /// <returns></returns>
        public string GetDateRandom(int int_Count)
        {
            string strData = DateTime.Now.ToString("ddhhmmss");
            strData = strData.Replace(":", "");
            strData = strData.Replace("-", "");
            strData = strData.Replace(" ", "");
            //strData = strData + Guid.NewGuid().ToString().Replace("-", "");
            strData = strData + GetRandom(int_Count); //把图片文件名改短
            return strData;
        }

        /// <summary>
        /// 取得随机数
        /// </summary>
        /// <param name="int_Count"></param>
        /// <returns></returns>
        public string GetRandom(int int_Count)
        {
            string str_RV = "1";
            for (int i = 0; i < int_Count - 2; i++)
            {
                str_RV = str_RV + "0";
            }
            Random r = new Random();
            str_RV = r.Next(int.Parse(str_RV)).ToString();
            int int_Count1 = int_Count - str_RV.Length;
            if (int_Count1 > 0)
            {
                for (int i = 0; i < int_Count1; i++)
                {
                    str_RV = str_RV + "0";
                }
            }
            return str_RV;
        }
    }
}