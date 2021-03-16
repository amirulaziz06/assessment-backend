<?php

namespace App\Imports;

use App\User;
use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Hash;

class UsersImport implements ToCollection
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */

    public function collection(Collection $rows)
    {
        foreach ($rows as $row) 
        {
            if($row[0] !=null)
            {
                User::updateOrCreate(['email' => $row[1]],
                [
                    'name' => $row[0],
                    'email'    => $row[1],
                    'password' => Hash::make($row[2]),
                ]);
            }
        }
    }
}
