{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

-- Module      : Network.AWS.IAM.V2010_05_08.GetAccountPasswordPolicy
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Retrieves the password policy for the AWS account. For more information
-- about using a password policy, go to Managing an IAM Password Policy.
-- https://iam.amazonaws.com/ ?Action=GetAccountPasswordPolicy
-- &Version=2010-05-08 &AUTHPARAMS 6, false false false false true
-- 7a62c49f-347e-4fc4-9331-6e8eEXAMPLE.
module Network.AWS.IAM.V2010_05_08.GetAccountPasswordPolicy where

import Network.AWS.Request.Query
import Network.AWS.IAM.V2010_05_08.Types
import Network.AWS.Prelude

data GetAccountPasswordPolicy = GetAccountPasswordPolicy
    deriving (Eq, Show, Generic)

instance ToQuery GetAccountPasswordPolicy where
    toQuery = genericToQuery def

instance AWSRequest GetAccountPasswordPolicy where
    type Sv GetAccountPasswordPolicy = IAM
    type Rs GetAccountPasswordPolicy = GetAccountPasswordPolicyResponse

    request = post "GetAccountPasswordPolicy"
    response _ = xmlResponse

data GetAccountPasswordPolicyResponse = GetAccountPasswordPolicyResponse
    { _gapprPasswordPolicy :: PasswordPolicy
      -- ^ The PasswordPolicy data type contains information about the
      -- account password policy. This data type is used as a response
      -- element in the action GetAccountPasswordPolicy.
    } deriving (Generic)

instance FromXML GetAccountPasswordPolicyResponse where
    fromXMLOptions = xmlOptions
