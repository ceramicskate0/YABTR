Param(
[string] $IP="localhost"
[string] $outputFile="C:\"
)

$Assem = ( 
    “Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c” , 
    “Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c” 
    ) 
    
Get-Service -ComputerName $IP | Where-Object {$_.status -eq "running"} | select Name,DisplayName,MachineName,ServiceName,Status,ServiceType | Export-Csv -Path $outputFile

$source = @”  
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mime;
using System.Net.Mail;
using System.IO;
using System.Management.Automation;
using System.Management.Automation.Runspaces;

namespace ServicesAudit 
{
 public static class ServicesAuditClass
 {
     public static List<Machine> Machines = new List<Machine>();

     public static void Parse(string FilePath)
     {
         

     }
     public static bool Compare(Aservice Machine)
     {

     }
 }
 public static class Machine
 {
            public static string MachineName {get;set;}
            public static List<Aservice> Services = new  List<Aservice>();

        public void AddService(int num, string text)
        {
            Aservice value = new Aservice();
            value.num = num;
            value.text = text;
            Aservice.Add(value);
        }
 }
  public static class Aservice
 {
       public static string Name {get;set;}
       public static string DisaplyName {get;set;}
       public static string ServiceName {get;set;}
       public static string Status {get;set;}
       public static string ServiceType {get;set;}
 }
} 
“@

Get-Service -ComputerName $IP | Where-Object {$_.status -eq "running"} | select Name,DisplayName,MachineName,ServiceName,Status,ServiceType | Export-Csv -Path $outputFile
