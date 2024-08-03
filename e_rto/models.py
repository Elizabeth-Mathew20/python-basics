from django.db import models

class user(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    address=models.CharField(max_length=100)
    dob=models.CharField(max_length=100)
    password=models.CharField(max_length=100)

class police(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    address=models.CharField(max_length=100)
    password=models.CharField(max_length=100)

class checkpost(models.Model):
    name=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    address=models.CharField(max_length=100)
    password=models.CharField(max_length=100)

class vehicles(models.Model):
    uid=models.CharField(max_length=100)
    reg_no=models.CharField(max_length=100)
    ownwer_name=models.CharField(max_length=100)
    address=models.CharField(max_length=100)
    cmpny_name=models.CharField(max_length=100)
    vehicle_type=models.CharField(max_length=100)
    fuel_type=models.CharField(max_length=100)
    engine_cc=models.CharField(max_length=100)
    ins_exdate=models.CharField(max_length=100)
    pollution_edate=models.CharField(max_length=100)
    reg_edate=models.CharField(max_length=100)
    ins=models.FileField(max_length=100)
    pollution=models.FileField(max_length=100)


class fines(models.Model):
    reg_no=models.CharField(max_length=100)
    uid=models.CharField(max_length=100)
    date=models.CharField(max_length=100)
    reason=models.CharField(max_length=100)
    amount=models.CharField(max_length=100)
    checkpost_id=models.CharField(max_length=100)

class fines_payment(models.Model):
    reg_no=models.CharField(max_length=100)
    uid=models.CharField(max_length=100)
    date=models.CharField(max_length=100)
    card_type=models.CharField(max_length=100)
    amount=models.CharField(max_length=100)
    card_name=models.CharField(max_length=100)
    card_no=models.CharField(max_length=100)
    cvv=models.CharField(max_length=100)

class complaints(models.Model):
    reg_no=models.CharField(max_length=100)
    uid=models.CharField(max_length=100)
    date=models.CharField(max_length=100)
    reason=models.CharField(max_length=100)
    checkpost_id=models.CharField(max_length=100)