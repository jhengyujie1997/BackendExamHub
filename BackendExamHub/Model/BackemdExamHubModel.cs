using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BackendExamHub.Model
{
    public class Myoffice_ACPD
    {
        public string acpd_sid { get; set; }            // 使用者主鍵
        public string acpd_cname { get; set; }          // 中文名稱
        public string acpd_ename { get; set; }          // 英文名稱
        public string acpd_sname { get; set; }          // 簡稱
        public string acpd_email { get; set; }          // 電子郵件
        public byte? acpd_status { get; set; }          // 狀況 0=正常 , 99=不正常
        public bool? acpd_stop { get; set; }            // 是否停用/不可登入
        public string acpd_stopMemo { get; set; }       // 停用原因
        public string acpd_LoginID { get; set; }        // 登入帳號
        public string acpd_LoginPW { get; set; }        // 登入密碼
        public string acpd_memo { get; set; }           // 備註
        public DateTime? acpd_nowdatetime { get; set; } // 新增日期
        public string appd_nowid { get; set; }          // 新增人員代碼
        public DateTime? acpd_upddatetitme { get; set; } // 修改日期
        public string acpd_updid { get; set; }          // 修改人員代碼
    }
}
