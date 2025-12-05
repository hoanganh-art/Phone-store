<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('employees', function (Blueprint $table) {
            $table->id('employees_id');
            $table->string('username',50); //Tên đăng nhập
            $table->string('password',255); //Mật khẩu
            $table->string('full_name',255); //Họ và tên
            $table->enum('role',['admin', 'employee']); //Vai trò
            $table->decimal('salary', 12, 2); //Lương
            $table->date('hire_date'); //Ngày vào làm
            $table->string('email',100); //Email
            $table->enum('status', ['active', 'inactive']); //Trạng thái
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};
