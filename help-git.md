---
title: "Git with jadi"
---


## نصب گیت

```bash
$ sudo apt-get install git
```
## تنظیمات اولیه (اختیاری)

- نصب شل `zsh`

```bash
$ sudo apt-get install zsh
```

- نصب تم `ohmyzsh` خط فرمان برای گیت (اختیاری)

```bash
$ sh -c “$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)”
```

- تنظیمات مربوط به شل `zsh`

```bash
$ sudo nano ~/.zshrc
```

- تنظیم تم 
([+](https://github.com/Kovah/oh-my-zsh-wiki/blob/master/Themes.md))

```
ZSH_THEME=”amuse”
```

- قرار دادن شل `zsh` به عنوان پیش فرض

```bash
$ sudo chsh -s $(which zsh) $(whoami)
```

## دستورات ارتباط با محیط کاری گیت

- ساخت گیت برای پروژه

```bash
$ git init
```

- راهنما

```bash
$ git help FunctionName
```

- افزودن فایل به فضای صحنه یا استیج (**Stage Space**)

```bash
$ git add filename
``

- ذخیره تغییرات فایل‌ها با پیام

```bash
$ git commit -m "message"
```

## دستورات گزارشی

- وضعیت فایل‌ها

```bash
$ git status
```

- تاریخچه کامیت‌ها

```bash
$ git log
```

- نگاه به تاریخچه خاص با هش

```bash
$ git show <Hash>
```

## ویرایش فایل

- ساخت فایل حاوی لیست فایل های غیر مجاز برای گیت

```bash
$ touch .gitignore
```

- چک کردن تغییرات

```bash
$ git diff HEAD 
```
- تفاوت فایل ویرایش شده در استیج با نسخه قبلی

```bash
$ git diff filename
```

- خارج کردن فایل از حالت استیج

```bash
$ git reset filename
```

- برگرداندن فایل به آخرین نسخه قبل از ویرایش

```bash
$ git checkout -- filename
```

- تغییر نام فایل (حتما تغییرات را ذخیره کنید.)

```bash
$ git mv OldFileName NewFileName
```

- حذف فایل هم از گیت هم از سیستم

```bash
$ git rm filename
```

## شاخه‌ها

- دیدن همه‌ها شاخه‌ها

```bash
$ git branch
```

- ساخت یک شاخه جدید

```bash
$ git branch NewBranchName
```

- جابجایی بین شاخه‌ها

```bash
$ git checkout BranchName
```

- ادغام شاخه‌ها به شاخه اصلی

```bash
$ git merge BranchName
```

- حذف شاخه

```bash
$ git -d BranchName
```

## فضای ابری

- کپی یک منبع گیت در فضای دیسک رایانه

```bash
$ git clone RepoAddress
```

- واکشی فایل پروژه از فضای ابری گیت

```bash
$ git pull origin master
```

- چک کردن ریموت‌ها

```bash
$ git remote
```
- افزودن ریموت یا کنترل از راه دور از گیت به پروژه

```bash
$ git remote add origin RepoAdress
```

- افزودن کل پروژه به ریپازیتوری یا منبع گیت

```bash
$ git push origin master
```

## برچسب

- دیدن همه‌ی برچسب‌ها

```bash
$ git tag
```

- برچب زدن به آخرین نسخه پروژه

```bash
$ git tag -a TagName -m "Message"
```

- برچسب زدن روی تاریخچه با هش

```bash
$ git tag -a TagName Hash
```

- دیدن پروژه با برچسب خاص

```bash
$ git show TagName
```

- افزودن برچسب به مخزن

```bash
$ git push origin TagName
```

- جابجایی بین برچسب‌های مختلف
```bash
$ git checkout TagName
```


## امضای دیجیتال یا gpg  

- لیست کلید‌ها

```bash
$ gpg --list-keys
```

- ساخت امضا

```bash
$ gpg --gen-key
```
```
pub   rsa3072 2021-09-01 [SC] [expires: 2023-09-01]
      4DA0EDE8CCB25349B50941067869A9BD2780069D
uid                      mohsen ebrahimi <mohsenebrahimy.ir@gmail.com>
sub   rsa3072 2021-09-01 [E] [expires: 2023-09-01]
```

- کلید امضا

```bash
$ gpg --list-secret-keys --keyid-format LONG
```
```
/home/mohsen/.gnupg/pubring.kbx
-------------------------------
sec   rsa3072/7869A9BD2780069D 2021-09-01 [SC] [expires: 2023-09-01]
      4DA0EDE8CCB25349B50941067869A9BD2780069D
uid                 [ultimate] mohsen ebrahimi <mohsenebrahimy.ir@gmail.com>
ssb   rsa3072/8EF509A2718721E3 2021-09-01 [E] [expires: 2023-09-01]
```

- تنظیم امضا روی گیت

```bash
$ git config --global user.signingkey 7869A9BD2780069D
```



- برچسب زدن با امضا

```bash
$ git tag -s TagNameSigned -m "Messege"
```

- دیدن تگ با امضا

```bash
$ git show TagNameSigned
```
```
tag TagNameSigned
Tagger: mohsenebrahimyir <mohsenebrahimy@outlook.com>
Date:   Wed Sep 1 21:58:22 2021 +0430

this is ME who is releasing version
-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEETaDt6MyyU0m1CUEGeGmpvSeABp0FAmEvuDYACgkQeGmpvSeA
Bp0VWAwAiCH8sx4qN0QnIQUmXeS2Zb3QUXwkvwqdnfrWJ/PUd2wxHit0gsyncR70
E/ZJU9oEl89/g+iCVbNcv6H+BrT3pMbuVyWskJHsfkqNSO0O8g5bmLieZ+MGXogg
SB3HMHMxT7JJsmBkly+gjLcXm4lJStiAw5yqVPcYQKYMOOZbwB4MLzviJG1LMSUi
CBPK/euytjdivPv1HcvsoiDRiXZoC0cQR5Xg9pxFjgXvkzzj+23hOQdXj7AG154t
LEguF0F0dBlaSGvROOYGQmzJ8F/eSuQWn2erLPwFbrWFsQw4csJJE6H5uxJ2OjKO
BqTGzk2zlRgRiXCtDhyVluKwZCvJN9ky9gqV0aDZmukHxI/nx0wg4TBQ3vQDsQF4
5MMNVcrNlv81kpdUuaen4w5u53H5+20RA+U/d759MtDe84tle5KFH/BqKPhwUuq5
Ls0Pru/K29PlHvYHdCztNjDxGyb5jkDJNCZA5/qy8GfU3YrQkvyXd606ZLAxQcmP
q85LC5O+
=4uH4
-----END PGP SIGNATURE-----

commit 153fd9cafe359bdd166fb406e07a9610922947bc (HEAD -> main, tag: v1.1, tag: v1.0, origin/main)
```

- اعتبارسنجی برچسب امضا شده

```bash
$ git tag -v TagNameSigned
```
```
object 153fd9cafe359bdd166fb406e07a9610922947bc
type commit
tag TagNameSigned
tagger mohsenebrahimyir <mohsenebrahimy@outlook.com> 1630517302 +0430

Messege
gpg: Signature made ‫چارشنبه ۰۱ سپتامبر ۲۱، 
gpg:                using RSA key 4DA0EDE8CCB25349B50941067869A9BD2780069D
gpg: Good signature from "mohsen ebrahimi <mohsenebrahimy.ir@gmail.com>" [ultimate]
```

- ذخیره کردن تغییرات با امضا

```bash
$ git commit -S -m "Message"
```

## متهم کردن

```bash
$ git blame FileName -L10
```


- جستجوی یاگ در ذخیره‌ها

1. شروع جستجو

```bash
$ git bisect start
```

2. این مرحله بد و خراب است

```bash
$ git bisec bad
```

3. این مرحله خوب بوده

```bash
$ git bisec good Hash
```
