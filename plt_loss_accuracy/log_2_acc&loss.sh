#bash
#20180818

grep "mbox_loss =" $1 > 1.txt
awk -F ']     ' '{print $2}' 1.txt > 1_loss.txt
rm 1.txt
awk -F '(' '{print $1}' 1_loss.txt >11_loss.txt
rm 1_loss.txt


grep ", loss =" $1 > 2.txt
awk -F '] ' '{print $2}' 2.txt > 2_loss.txt
rm 2.txt

paste 2_loss.txt 11_loss.txt > mbox_loss.txt
rm 11_loss.txt 2_loss.txt

grep "detection_eval =" $1 > acc_.txt
awk -F ']     ' '{print $2}' acc_.txt  > acc_a.txt
rm acc_.txt

grep "Testing net (#0)" $1 > acc_2.txt
awk -F ']' '{print $2}' acc_2.txt  > acc_b.txt
rm acc_2.txt

paste acc_b.txt acc_a.txt > mAP.txt
rm acc_a.txt acc_b.txt