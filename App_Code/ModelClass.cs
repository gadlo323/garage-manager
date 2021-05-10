using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace GargeManger.App_Code
{
    public class ModelClass
    {
        private string tozeret_cd;
        private string degem_cd;
        private string degem_nm;
        private string shnat_yitzur;
        private string nefah_manoa;
        private string mishkal_kolel;
        private string category;
        private string ramat_gimur;
        private string delek_nm;
        private string kinuy_mishari;

        public string kinuy_mishariK        {
            get { return kinuy_mishari; }
            set { kinuy_mishari = value; }
        }

        public string Delek_nm
        {
            get { return delek_nm; }
            set { delek_nm = value; }
        }

        public string Ramat_gimur
        {
            get { return ramat_gimur; }
            set { ramat_gimur = value; }
        }

        public string Category
        {
            get { return category; }
            set { category = value; }
        }


        public string Mishkal_kolel
        {
            get { return mishkal_kolel; }
            set { mishkal_kolel = value; }
        }

        public string Nefah_manoa
        {
            get { return nefah_manoa; }
            set { nefah_manoa = value; }
        }

        public string Shnat_yitzur
        {
            get { return shnat_yitzur; }
            set { shnat_yitzur = value; }
        }


        public string Degem_nm
        {
            get { return degem_nm; }
            set { degem_nm = value; }
        }

        public string Degem_cd
        {
            get { return degem_cd; }
            set { degem_cd = value; }
        }


        public string Tozeret_cd
        {
            get { return tozeret_cd; }
            set { tozeret_cd = value; }
        }

        public ModelClass(string tozeret_cd, string degem_cd, string degem_nm, string shnat_yitzur,
            string nefah_manoa, string mishkal_kolel, string category, string ramat_gimur,
            string delek_nm, string kinuy_mishari)
        {
            this.tozeret_cd = tozeret_cd;
            this.degem_cd = degem_cd;
            this.degem_nm = degem_nm;
            this.shnat_yitzur = shnat_yitzur;
            this.nefah_manoa = nefah_manoa;
            this.mishkal_kolel = mishkal_kolel;
            this.category = category;
            this.ramat_gimur = ramat_gimur;
            this.delek_nm = delek_nm;
            this.kinuy_mishari = kinuy_mishari;
        }

        public static DataTable GeModelName(string id,string Shnat_Yitzur,string Tozeret_cd)
        {
            //List<string> dagemInfo = new List<string>();
            sql_class sql = new sql_class();
            DataTable data = sql.Where("degem_cd", id)
                .Where("shnat_yitzur", Shnat_Yitzur)
                .Where("tozeret_cd", Tozeret_cd)
                .Get("Model");
            if (data.Rows.Count > 0)
            {
                return data;
            }
            else return null;
        }
    }
}