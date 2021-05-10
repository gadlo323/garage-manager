using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using GargeManger.App_Code;


namespace GargeManger
{
    public class sql_class
    {
        private static readonly string myConnStr = ConfigurationManager.ConnectionStrings["city"].ToString();
        private static SqlConnection connection;
        private  string where = null;
        private string order = null;
        private string limit = null;

        public sql_class()
        {
            connection = new SqlConnection(myConnStr);
            connection.Open();

        }

        
        public bool Insert(string table, List<DbListAdapter> data)
        {
            if (table == null || data.Count == 0)
                return false;

            string secSql = "";
            string sql = "INSERT INTO " + table + "(";

            for (int i = 0; i < data.Count; i++)
            {
                sql += data[i].field;
                secSql += "'" + data[i].value + "'";

                if (i == data.Count - 1)
                {
                    sql += ")";
                    secSql += ")";
                }
                else
                {
                    sql += ",";
                    secSql += ",";
                }
            }

            sql += " VALUES (" + secSql;

            if (new SqlCommand(sql, connection).ExecuteNonQuery() == 0)
                return false;

            connection.Dispose();
            return true;


            //var Cmd = new SqlCommand(sql, connection);
            //int effectedRows;
            //effectedRows = Cmd.ExecuteNonQuery();
        }
        
        public sql_class Where(string field, string value, string oper = "=")
        {
            if (where != null)
                where += "AND ";
            else
                where = " WHERE ";

            where += field + oper + "'" + value + "' ";

            return this;
        }

        public sql_class OrWhere(string field, string value, string oper = "=")
        {
            if (where != null)
                where += "OR ";
            else
                where = "WHERE ";

            where += field + oper + "'" + value + "' ";

            return this;
        }

        public sql_class Sort(string method, params string[] fields)
        {
            if (method != "ASC" && method != "DESC")
                throw new ArgumentException(String.Format("The method {0} cannot be execute!", method));

            if (fields.Length == 0)
                throw new ArgumentException("You must provide at least 1 field for ordering");

            order = "ORDER BY ";

            for (int i = 0; i < fields.Length; i++)
            {
                order += fields[i];

                if (i != fields.Length - 1)
                    order += ", ";
                else
                    order += " ";
            }

            order += method + " ";

            return this;

        }

        public sql_class Limit(int number)
        {
            if (number < 1)
                throw new ArgumentException("You must provide number greater than 0.");

            limit = "TOP " + number.ToString() + " ";

            return this;
        }

        public DataTable Get(string table, params string[] fields)
        {
            if (table == null)
                throw new ArgumentNullException(table);

            string sql = "SELECT ";

            if (limit != null)
                sql += limit;

            if (fields.Length == 0)
                sql += "* ";
            else
            {
                for (int i = 0; i < fields.Length; i++)
                {
                    sql += fields[i];

                    if (i != fields.Length - 1)
                        sql += ", ";
                    else
                        sql += " ";
                }
            }

            sql += "FROM " + table + " ";

            if (where != null)
                sql += where;

            if (order != null)
                sql += order;

            var Cmd = new SqlCommand(sql, connection);

            var DataTable = new DataTable();
            var DataAdapter = new SqlDataAdapter();

            DataAdapter.SelectCommand = Cmd;

            DataAdapter.Fill(DataTable);

            connection.Dispose();
            return DataTable;
        }

        public bool Update(string table, List<DbListAdapter> data)
        {
            if (String.IsNullOrEmpty(table) || data.Count==0)
                return false;
            string UpdSql = "UPDATE " + table + " SET ";
            for (int i = 0; i < data.Count; i++)
            {
                while(String.IsNullOrEmpty(data[i].value))
                {
                    if (i == data.Count - 1)
                        break;
                    i++;
                }
                if (i == data.Count - 1 && String.IsNullOrEmpty(data[data.Count-1].value))
                {
                   UpdSql = UpdSql.Remove(UpdSql.Length - 1);
                    UpdSql += where;
                    if (new SqlCommand(UpdSql, connection).ExecuteNonQuery() == 0)
                        return false;

                    connection.Dispose();
                    return true;
                }
                   

                UpdSql += data[i].field + "=";
                UpdSql += "'" + data[i].value + "'";
                if (i == data.Count - 1)
                {
                    
                    UpdSql += where;
                    if (new SqlCommand(UpdSql, connection).ExecuteNonQuery() == 0)
                        return false;

                    connection.Dispose();
                    return true;
                }
                else
                {
                    if (i == data.Count - 1)
                        UpdSql = UpdSql.Remove(UpdSql.Length - 1);
                    else
                        UpdSql += ",";
                    
                }
            }
            return false;
            
        }

        //oprtor LIKE
        public sql_class WhereLIKE(string field, string oper)
        {
            if (where != null)
                where += "OR ";
            else
                where = "WHERE ";

            where += field + "  " + "LIKE " + "  " +" '" + oper+ "%"+"'";

            return this;
        }

        public DataTable Delete(string table, params string[] fields)
        {
            if (table == null)
                throw new ArgumentNullException(table);

            string sql = "delete ";

            if (limit != null)
                sql += limit;

            if (fields.Length > 0)
            {
                for (int i = 0; i < fields.Length; i++)
                {
                    sql += fields[i];

                    if (i != fields.Length - 1)
                        sql += ", ";
                    else
                        sql += " ";
                }
            }

            sql += "FROM " + table + " ";

            if (where != null)
                sql += where;

            if (order != null)
                sql += order;

            var Cmd = new SqlCommand(sql, connection);

            var DataTable = new DataTable();
            var DataAdapter = new SqlDataAdapter();

            DataAdapter.SelectCommand = Cmd;

            DataAdapter.Fill(DataTable);

            connection.Dispose();
            return DataTable;
        }
    }
}