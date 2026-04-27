using System;
using System.Diagnostics;
using System.Windows.Forms;

namespace Optimizer
{
    public sealed partial class AboutForm : Form
    {
        public AboutForm()
        {
            InitializeComponent();
            OptionsHelper.ApplyTheme(this);

            pictureBox1.BackColor = OptionsHelper.CurrentOptions.Theme;
        }

        private void About_Load(object sender, EventArgs e)
        {
            t1.Interval = 50;
            t2.Interval = 50;

            t1.Start();
        }

        private void t1_Tick(object sender, EventArgs e)
        {
            string s0 = "";
            string s1 = "O";
            string s2 = "Op";
            string s3 = "Opt";
            string s4 = "Opti";
            string s5 = "Optim";
            string s6 = "Optimi";
            string s7 = "Optimiz";
            string s8 = "Optimize";
            string s9 = "Optimizer";

            switch (l1.Text)
            {
                case "":
                    l1.Text = s1;
                    break;
                case "O":
                    l1.Text = s2;
                    break;
                case "Op":
                    l1.Text = s3;
                    break;
                case "Opt":
                    l1.Text = s4;
                    break;
                case "Opti":
                    l1.Text = s5;
                    break;
                case "Optim":
                    l1.Text = s6;
                    break;
                case "Optimi":
                    l1.Text = s7;
                    break;
                case "Optimiz":
                    l1.Text = s8;
                    break;
                case "Optimize":
                    l1.Text = s9;
                    t1.Stop();
                    t2.Start();
                    break;
                case "Optimizer":
                    l1.Text = s0;
                    break;
            }
        }

        private void t2_Tick(object sender, EventArgs e)
        {
            string s0 = "";
            string s1 = "O";
            string s2 = "OG";
            string s3 = "OGD";
            string s4 = "OGDe";
            string s5 = "OGDev";
            string s6 = "OGDev ";
            string s7 = "OGDev S";
            string s8 = "OGDev St";
            string s9 = "OGDev Stu";
            string s10 = "OGDev Stud";
            string s11 = "OGDev Studi";
            string s12 = "OGDev Studio";
            string s13 = "OGDev Studios";
            string s14 = "OGDev Studios ©";
            string s15 = "OGDev Studios © ";

            switch (l2.Text)
            {
                case "":
                    l2.Text = s1;
                    break;
                case "O":
                    l2.Text = s2;
                    break;
                case "OG":
                    l2.Text = s3;
                    break;
                case "OGD":
                    l2.Text = s4;
                    break;
                case "OGDe":
                    l2.Text = s5;
                    break;
                case "OGDev":
                    l2.Text = s6;
                    break;
                case "OGDev ":
                    l2.Text = s7;
                    break;
                case "OGDev S":
                    l2.Text = s8;
                    break;
                case "OGDev St":
                    l2.Text = s9;
                    break;
                case "OGDev Stu":
                    l2.Text = s10;
                    break;
                case "OGDev Stud":
                    l2.Text = s11;
                    break;
                case "OGDev Studi":
                    l2.Text = s12;
                    break;
                case "OGDev Studio":
                    l2.Text = s13;
                    break;
                case "OGDev Studios":
                    l2.Text = s14;
                    break;
                case "OGDev Studios ©":
                    l2.Text = s15;
                    t2.Stop();
                    break;
                case "OGDev Studios © ":
                    l2.Text = s0;
                    break;
            }
        }

        private void l2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Process.Start("https://github.com/SheLovesLqwid/OGDev-Studios-PC-Optimizer");
        }
    }
}
